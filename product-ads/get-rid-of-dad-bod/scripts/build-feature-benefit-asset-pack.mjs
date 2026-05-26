import { createRequire } from "node:module";
import path from "node:path";
import { fileURLToPath } from "node:url";

const require = createRequire(import.meta.url);
const scriptDir = path.dirname(fileURLToPath(import.meta.url));
const packetDir = path.resolve(scriptDir, "..");
const workspaceDir = path.resolve(packetDir, "../..");
const sharpPath = require.resolve("sharp", {
  paths: [
    process.cwd(),
    packetDir,
    workspaceDir,
    path.join(workspaceDir, "next", "node_modules")
  ]
});
const sharp = require(sharpPath);

const source = path.join(packetDir, "generated/assets/icon-sheets/feature-benefit-line-icons-v2-green.png");
const outDir = path.join(packetDir, "generated/assets/icons/feature-benefit-v2");
const contactSheetOut = path.join(outDir, "asset-contact-sheet-blue.png");
const transparentSheetOut = path.join(outDir, "feature-benefit-line-icons-v2-transparent-sheet.png");

const assets = [
  ["protein-flex-bicep", "Protein: flex bicep", "icons", 0, 0],
  ["protein-dumbbell", "Protein: dumbbell", "icons", 0, 1],
  ["protein-muscle-shield", "Protein: muscle shield", "icons", 0, 2],
  ["protein-scoop-arm", "Protein: scoop arm", "icons", 0, 3],
  ["low-sugar-cubes-slash", "Low sugar: cubes slash", "icons", 1, 0],
  ["low-sugar-cube-circle-slash", "Low sugar: cube circle slash", "icons", 1, 1],
  ["low-sugar-chocolate-slash", "Low sugar: chocolate slash", "icons", 1, 2],
  ["low-sugar-spoon-slash", "Low sugar: spoon slash", "icons", 1, 3],
  ["grass-leaf", "Grass fed: leaf", "icons", 2, 0],
  ["grass-sprout", "Grass fed: sprout", "icons", 2, 1],
  ["grass-tuft", "Grass fed: grass tuft", "icons", 2, 2],
  ["grass-cow-outline", "Grass fed: cow outline", "icons", 2, 3],
  ["prep-shaker-check", "Prep: shaker check", "icons", 3, 0],
  ["prep-scoop-cup", "Prep: scoop cup", "icons", 3, 1],
  ["prep-cup-check", "Prep: cup check", "icons", 3, 2],
  ["prep-droplet-shaker", "Prep: droplet shaker", "icons", 3, 3],
  ["arrow-up-right-corner-a", "Arrow up-right corner A", "arrows", 4, 0],
  ["arrow-up-right-corner-b", "Arrow up-right corner B", "arrows", 4, 1],
  ["arrow-up-left-corner-a", "Arrow up-left corner A", "arrows", 4, 2],
  ["arrow-down-left-curve-a", "Arrow down-left curve A", "arrows", 4, 3],
  ["arrow-up-left-corner-b", "Arrow up-left corner B", "arrows", 5, 0],
  ["arrow-up-left-corner-c", "Arrow up-left corner C", "arrows", 5, 1],
  ["arrow-up-left-corner-d", "Arrow up-left corner D", "arrows", 5, 2],
  ["arrow-up-left-curve-a", "Arrow up-left curve A", "arrows", 5, 3],
  ["arrow-down-right-curve-a", "Arrow down-right curve A", "arrows", 6, 0],
  ["arrow-down-right-curve-b", "Arrow down-right curve B", "arrows", 6, 1],
  ["arrow-down-right-curve-c", "Arrow down-right curve C", "arrows", 6, 2],
  ["arrow-down-right-curve-d", "Arrow down-right curve D", "arrows", 6, 3],
  ["arrow-down-right-corner-a", "Arrow down-right corner A", "arrows", 7, 0],
  ["arrow-down-left-corner-a", "Arrow down-left corner A", "arrows", 7, 1],
  ["arrow-down-left-curve-b", "Arrow down-left curve B", "arrows", 7, 2],
  ["arrow-down-left-curve-c", "Arrow down-left curve C", "arrows", 7, 3]
];

function transparentFromGreen(data, info) {
  const output = Buffer.from(data);
  for (let i = 0; i < output.length; i += 4) {
    const red = output[i];
    const green = output[i + 1];
    const blue = output[i + 2];
    const nonGreen = Math.max(red, blue);
    const keyLike = green > 120 && green - nonGreen > 18;
    if (keyLike) {
      output[i + 3] = 0;
      continue;
    }
    output[i] = 255;
    output[i + 1] = 255;
    output[i + 2] = 255;
    output[i + 3] = output[i + 3] > 12 ? 255 : 0;
  }
  return { data: output, info };
}

function findAlphaBox(data, width, height, padding = 18) {
  let minX = width;
  let minY = height;
  let maxX = -1;
  let maxY = -1;

  for (let y = 0; y < height; y += 1) {
    for (let x = 0; x < width; x += 1) {
      const alpha = data[(y * width + x) * 4 + 3];
      if (alpha < 20) continue;
      minX = Math.min(minX, x);
      minY = Math.min(minY, y);
      maxX = Math.max(maxX, x);
      maxY = Math.max(maxY, y);
    }
  }

  if (maxX < 0) return { left: 0, top: 0, width, height };

  minX = Math.max(0, minX - padding);
  minY = Math.max(0, minY - padding);
  maxX = Math.min(width - 1, maxX + padding);
  maxY = Math.min(height - 1, maxY + padding);

  return {
    left: minX,
    top: minY,
    width: maxX - minX + 1,
    height: maxY - minY + 1
  };
}

function removeSmallAlphaComponents(data, width, height, minPixels = 20) {
  const output = Buffer.from(data);
  const seen = new Uint8Array(width * height);
  const queue = [];

  for (let y = 0; y < height; y += 1) {
    for (let x = 0; x < width; x += 1) {
      const startIndex = y * width + x;
      if (seen[startIndex] || output[startIndex * 4 + 3] < 20) continue;

      const component = [];
      let head = 0;
      seen[startIndex] = 1;
      queue.push([x, y]);

      while (head < queue.length) {
        const [cx, cy] = queue[head];
        head += 1;
        component.push([cx, cy]);

        for (let ny = cy - 1; ny <= cy + 1; ny += 1) {
          for (let nx = cx - 1; nx <= cx + 1; nx += 1) {
            if (nx < 0 || ny < 0 || nx >= width || ny >= height) continue;
            const nextIndex = ny * width + nx;
            if (seen[nextIndex] || output[nextIndex * 4 + 3] < 20) continue;
            seen[nextIndex] = 1;
            queue.push([nx, ny]);
          }
        }
      }

      if (component.length < minPixels) {
        component.forEach(([cx, cy]) => {
          output[(cy * width + cx) * 4 + 3] = 0;
        });
      }
      queue.length = 0;
    }
  }

  return output;
}

function contactSheetLabel(text, x, y) {
  return `
    <svg width="220" height="28" xmlns="http://www.w3.org/2000/svg">
      <text x="0" y="18" fill="#fff" font-family="Arial, sans-serif" font-size="12">${text}</text>
    </svg>
  `.trim();
}

async function build() {
  const sheet = sharp(source).ensureAlpha();
  const rawSheet = await sheet.raw().toBuffer({ resolveWithObject: true });
  const transparentSheet = transparentFromGreen(rawSheet.data, rawSheet.info);
  await sharp(transparentSheet.data, {
    raw: {
      width: rawSheet.info.width,
      height: rawSheet.info.height,
      channels: 4
    }
  }).png().toFile(transparentSheetOut);

  const rowBounds = [
    [0, 210],
    [210, 410],
    [410, 590],
    [590, 780],
    [780, 910],
    [910, 1030],
    [1030, 1160],
    [1160, rawSheet.info.height]
  ];
  const written = [];

  for (const [name, label, group, row, col] of assets) {
    const left = Math.round(col * rawSheet.info.width / 4);
    const [top, bottom] = rowBounds[row];
    const width = col === 3 ? rawSheet.info.width - left : Math.floor(rawSheet.info.width / 4);
    const height = bottom - top;
    const cell = await sharp(transparentSheet.data, {
      raw: {
        width: rawSheet.info.width,
        height: rawSheet.info.height,
        channels: 4
      }
    }).extract({ left, top, width, height }).raw().toBuffer({ resolveWithObject: true });
    const cleanCell = removeSmallAlphaComponents(cell.data, cell.info.width, cell.info.height);
    const box = findAlphaBox(cleanCell, cell.info.width, cell.info.height, group === "arrows" ? 20 : 24);
    const outPath = path.join(outDir, `${name}.png`);
    await sharp(cleanCell, {
      raw: {
        width: cell.info.width,
        height: cell.info.height,
        channels: 4
      }
    }).extract(box).png().toFile(outPath);
    written.push({ name, label, group, src: outPath });
  }

  const cell = 260;
  const cols = 4;
  const rows = Math.ceil(written.length / cols);
  const composites = [];
  for (let index = 0; index < written.length; index += 1) {
    const item = written[index];
    const col = index % cols;
    const row = Math.floor(index / cols);
    const image = await sharp(item.src)
      .resize({ width: 172, height: 172, fit: "inside", withoutEnlargement: true })
      .png()
      .toBuffer();
    composites.push({
      input: image,
      left: col * cell + 44,
      top: row * cell + 28
    });
    composites.push({
      input: Buffer.from(contactSheetLabel(item.name, 0, 0)),
      left: col * cell + 12,
      top: row * cell + 214
    });
  }

  await sharp({
    create: {
      width: cols * cell,
      height: rows * cell,
      channels: 4,
      background: "#1f5a9b"
    }
  }).composite(composites).png().toFile(contactSheetOut);

  console.log(`Wrote ${written.length} assets to ${path.relative(process.cwd(), outDir)}`);
}

await build();
