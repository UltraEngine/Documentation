--Load required plugins
local plugin = LoadPlugin("Plugins/ISPCTexComp.*")
local plugin2 = LoadPlugin("Plugins/Basis.*")

--Load image
local pixmap = LoadPixmap("Materials/77684-blocks18c_1.jpg")

--Convert to RGBA if not already
if pixmap.format ~= TEXTURE_RGBA then
	pixmap = pixmap:Convert(TEXTURE_RGBA)
end
Print("--------------------------")
--Save pixmap to texture file
if SaveTexture("OUTPUT.basis", TEXTURE_2D, {pixmap}, 1, SAVE_DEFAULT) then
	Print("Basis texture saved!")
else
	Print("We have a problem!")
end

--Save pixmap to texture file, with mipmaps
if SaveTexture("OUTPUT+mipmaps.basis", TEXTURE_2D, {pixmap}, 1, SAVE_BUILD_MIPMAPS) then
	Print("Basis texture saved!")
else
	Print("We have a problem!")
end

--Save uncompressed DDS file
SaveTexture("UNCOMPRESSED.dds", TEXTURE_2D, {pixmap}, 1, SAVE_DEFAULT)

--Save uncompressed DDS file, with mipmaps
SaveTexture("UNCOMPRESSED+mipmaps.dds", TEXTURE_2D, {pixmap}, 1, SAVE_BUILD_MIPMAPS)
Print("--------------------------")

--Generate mipmaps
local mipchain = {}
table.insert(mipchain,pixmap)
local w = pixmap.size.x
local h = pixmap.size.y
local mipmap = pixmap
while (w > 1 and h > 1) do
	w = math.max(1, w / 2)
	h = math.max(1, h / 2)
	mipmap = mipmap:Downsample()
	table.insert(mipchain,mipmap)
end

--Convert all mipmaps to BC1 (DXT1) compression
local tm = Millisecs()
for n=1, #mipchain do
	mipchain[n] = mipchain[n]:Convert(TEXTURE_BC7)
end
Print(Millisecs()-tm)
Print("--------------------------")

--Save mipchain to texture file
if SaveTexture("COMPRESSED+mipmaps.dds", TEXTURE_2D, mipchain, 1, SAVE_DEFAULT) then
	Print("DDS texture saved!")
else
	Print("We have a problem!")
end
