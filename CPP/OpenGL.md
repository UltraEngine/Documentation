# OpenGL

You can use OpenGL or another graphics API to create a 3D viewport in a GUI application. The example below shows minimal OpenGL context creation on a standard window:

```c++
//---------------------------------------------------------------
//
// This example creates an OpenGL rendering context on a window
// 
//---------------------------------------------------------------

#include "UltraEngine.h"

#include <GL/GL.h>
#pragma comment (lib, "opengl32.lib")

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Get the available displays
	auto displays = ListDisplays();

	//Create a window
	auto window = CreateWindow("OpenGL Example", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

	while (PeekEvent())
	{
		WaitEvent();
	}

	//Initialize OpenGL context
	HWND hwnd = window->GetHandle();
	HDC hdc = GetDC(hwnd);

	PIXELFORMATDESCRIPTOR pfd =
	{
		sizeof(PIXELFORMATDESCRIPTOR),
		1,
		PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER,    // Flags
		PFD_TYPE_RGBA,        // The kind of framebuffer. RGBA or palette.
		32,                   // Colordepth of the framebuffer.
		0, 0, 0, 0, 0, 0,
		0,
		0,
		0,
		0, 0, 0, 0,
		24,                   // Number of bits for the depthbuffer
		8,                    // Number of bits for the stencilbuffer
		0,                    // Number of Aux buffers in the framebuffer.
		PFD_MAIN_PLANE,
		0,
		0, 0, 0
	};

	if (SetPixelFormat(hdc, 1, &pfd) == 0)
	{
		Print("ChooosePixelFormat() failed.");
		return 0;
	}

	HGLRC glcontext = wglCreateContext(hdc);
	
	if (glcontext == NULL)
	{
		auto err = GetLastError();
		if (err == 2000) Print("Invalid pixel format.");
		Print("wglCreateContext() failed.");
		return 0;
	}

	wglMakeCurrent(hdc, glcontext);

	while (true)
	{
		//Check for events
		while (PeekEvent())
		{
			const Event ev = WaitEvent();
			switch (ev.id)
			{
			case EVENT_WINDOWCLOSE:
				if (ev.source == window)
				{
					return 0;
				}
				break;
			}
		}

		//OpenGL rendering
		iVec2 sz = window->ClientSize();
		glViewport(0, 0, sz.x, sz.y);
		glClearColor(0.0f, 0.0f, 1.0f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		SwapBuffers(hdc);
	}
	return 0;
}
```
