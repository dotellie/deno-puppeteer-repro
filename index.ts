import { default as puppeteer } from "npm:puppeteer@20.8.1";

const browser = await puppeteer.launch({
  headless: "new",
  args: ["--no-sandbox", "--disable-setuid-sandbox"],
});

console.log(await browser.version());

await browser.close();

Deno.exit(0);
