/** PDFKit can only embed JPEG and PNG. */
export function isSupportedPdfImage(buf: Buffer | undefined): boolean {
  if (!buf || buf.length < 4) return false;
  if (buf[0] === 0xff && buf[1] === 0xd8 && buf[2] === 0xff) return true;
  if (buf[0] === 0x89 && buf[1] === 0x50 && buf[2] === 0x4e && buf[3] === 0x47) return true;
  return false;
}

/**
 * Normalizes any image (WebP, AVIF, etc.) to a JPEG that PDFKit can embed,
 * downscaling to keep multi-product PDFs small. Returns null only when the
 * buffer cannot be decoded at all.
 */
export async function preparePdfImage(buf: Buffer, maxDim = 640): Promise<Buffer | null> {
  try {
    const mod = (await import(/* webpackIgnore: true */ "sharp")) as unknown as {
      default?: (input: Buffer) => SharpLike;
    } & ((input: Buffer) => SharpLike);
    const sharpFn = mod.default ?? mod;
    const out = await sharpFn(buf)
      .resize(maxDim, maxDim, { fit: "inside", withoutEnlargement: true })
      .jpeg({ quality: 62 })
      .toBuffer();
    return isSupportedPdfImage(out) ? out : null;
  } catch {
    // sharp unavailable: fall back to the original only when PDFKit supports it.
    return isSupportedPdfImage(buf) ? buf : null;
  }
}

type SharpLike = {
  resize: (
    w: number,
    h: number,
    opts?: { fit?: "inside" | "cover"; withoutEnlargement?: boolean }
  ) => { jpeg: (opts: { quality: number }) => { toBuffer: () => Promise<Buffer> } };
};
