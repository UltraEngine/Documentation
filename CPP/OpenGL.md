# OpenGL Rendering

You can use OpenGL or another graphics API to create a 3D viewport in a GUI application. The example below shows minimal OpenGL context creation on a standard window and renders an empty scene in real-time.

```c++
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

	if (SetPixelFormat(hdc, 1, &pfd) == 0) RuntimeError("SetPixelFormat() failed.");

	HGLRC glcontext = wglCreateContext(hdc);
	
	if (glcontext == NULL) RuntimeError("wglCreateContext() failed.");

	wglMakeCurrent(hdc, glcontext);

	while (!window->Closed())
	{
                iVec2 sz = subwindow->ClientSize();
                glViewport(0, 0, sz.x, sz.y);
                glClearColor(0.15f, 0.15f, 0.15f, 1.0f);
                glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

                glBegin(GL_TRIANGLES);
                glColor3f(1, 0, 0);
                glVertex3f(0, 0.5, 0);
                glColor3f(0, 1, 0);
                glVertex3f(0.5, -0.5, 0);
                glColor3f(0, 0, 1);
                glVertex3f(-0.5, -0.5, 0);
                glEnd();

                SwapBuffers(hdc);
	}
	return 0;
}
```

The next example mixes GUI interface elements with OpenGL rendering by creating the OpenGL context on a child window. This application uses event-driven timing instead of continuously rendering the viewport. A callback is used to resize the viewport window when the parent window is resized.

<img src = 'https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/opengl_window.png' />

```c++
#include "UltraEngine.h"

#include <GL/GL.h>
#pragma comment (lib, "opengl32.lib")

using namespace UltraEngine;

bool ResizeViewport(const Event& ev, shared_ptr<Object> extra)
{
    if (ev.id == EVENT_WINDOWSIZE)
    {
        auto window = ev.source->As<Window>();
        iVec2 sz = window->ClientSize();
        auto subwindow = extra->As<Window>();
        subwindow->SetShape(200 + 1, 8 + 1, sz.x - 200 - 8 - 2, sz.y - 16 - 2);
    }
    return true;
}

int main(int argc, const char* argv[])
{
    //Get the available displays
    auto displays = ListDisplays();

    //Create a window
    auto window = CreateWindow("OpenGL Example", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

    //Create user interface
    auto ui = CreateInterface(window);
    iVec2 sz = ui->root->ClientSize();
    auto treeview = CreateTreeView(8, 8, 200 - 16, sz.y - 16, ui->root);
    treeview->SetLayout(1, 0, 1, 1);
    treeview->root->AddNode("Object 1");
    treeview->root->AddNode("Object 2");
    treeview->root->AddNode("Object 3");

    auto panel = CreatePanel(200, 8, sz.x - 200 - 8, sz.y - 16, ui->root, PANEL_BORDER);
    panel->SetLayout(1, 1, 1, 1);
    panel->SetColor(0.15, 0.15, 0.15, 1);

    //Create viewport window
    auto subwindow = CreateWindow("", 200 + 1, 8 + 1, sz.x - 200 - 8 - 1, sz.y - 16 - 1, window, WINDOW_CHILD);

    //Adjust the viewport size when main window resized
    ListenEvent(EVENT_WINDOWSIZE, window, ResizeViewport, subwindow);

    //Initialize OpenGL context
    HWND hwnd = subwindow->GetHandle();
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

    if (SetPixelFormat(hdc, 1, &pfd) == 0) RuntimeError("SetPixelFormat() failed.");

    HGLRC glcontext = wglCreateContext(hdc);

    if (glcontext == NULL) RuntimeError("wglCreateContext() failed.");

    wglMakeCurrent(hdc, glcontext);

    while (true)
    {
        //Check for events
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWPAINT:
            if (ev.source == subwindow)
            {
                iVec2 sz = subwindow->ClientSize();
                glViewport(0, 0, sz.x, sz.y);
                glClearColor(0.15f, 0.15f, 0.15f, 1.0f);
                glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

                glBegin(GL_TRIANGLES);
                glColor3f(1, 0, 0);
                glVertex3f(0, 0.5, 0);
                glColor3f(0, 1, 0);
                glVertex3f(0.5, -0.5, 0);
                glColor3f(0, 0, 1);
                glVertex3f(-0.5, -0.5, 0);
                glEnd();

                SwapBuffers(hdc);
            }
            break;
        case EVENT_WINDOWCLOSE:
            if (ev.source == window) return 0;
            break;
        }
    }
    return 0;
}
```

You can use these features to create tools that provide a graphical user interface combined with 3D rendering.
