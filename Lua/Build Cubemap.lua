--IO plugins needed
local plugin = LoadPlugin("Plugins/FITextureLoader.dll")
local plugin2 = LoadPlugin("Plugins/Basis.dll")

--Load skybox strip
local pixmap = LoadPixmap("Materials/zonesunset.png")
if pixmap.size.x ~= pixmap.size.y * 6 then
	Print("Error: Wrong image aspect.")
	return
end

--Convert to RGBA, if not already
if pixmap.format ~= TEXTURE_RGBA then
	pixmap = pixmap:Convert(TEXTURE_RGBA)
end

--Copy each face to a different pixmap
local faces = {}
for n = 1, 6 do
	faces[n] = CreatePixmap(pixmap.size.y,pixmap.size.y,pixmap.format)
	pixmap:CopyRect((n-1) * pixmap.size.y, 0, pixmap.size.y, pixmap.size.y, faces[n], 0, 0)
end

--Save as cube map
SaveTexture("CUBEMAP.dds", TEXTURE_CUBE, faces, 6, SAVE_DEFAULT)

--Save as cube map, with mipmaps
SaveTexture("CUBEMAP+mipmaps.dds", TEXTURE_CUBE, faces, 6, SAVE_BUILD_MIPMAPS)

--Save as cube map, with mipmaps
SaveTexture("CUBEMAP+mipmaps.basis", TEXTURE_CUBE, faces, 6, SAVE_BUILD_MIPMAPS)
