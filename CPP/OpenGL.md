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
	auto displays = GetDisplays();

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

	// Select an appropriate pixel format that is supported by the hdc
	int format = ChoosePixelFormat(hdc, &pfd);

	if (SetPixelFormat(hdc, format, &pfd) == 0) RuntimeError("SetPixelFormat() failed.");

	HGLRC glcontext = wglCreateContext(hdc);
	
	if (glcontext == NULL) RuntimeError("wglCreateContext() failed.");

	wglMakeCurrent(hdc, glcontext);

	while (!window->Closed())
	{
		iVec2 sz = window->ClientSize();
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

void Render(shared_ptr<Window> viewport)
{
    // Get and set the current size of the viewport
    iVec2 sz = viewport->ClientSize();
    if (sz.x < 1 or sz.y < 1) return;

    glViewport(0, 0, sz.x, sz.y);

    // Set clear colour of viewport background
    glClearColor(0.15f, 0.15f, 0.15f, 1.0f);

    // Clear colour and depth buffers
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    // Render our triangle
    glBegin(GL_TRIANGLES);

    // Vertex 1
    glColor3f(1, 0, 0);
    glVertex3f(0, 0.5, 0);

    // Vertex 2
    glColor3f(0, 1, 0);
    glVertex3f(0.5, -0.5, 0);

    // Vertex 3
    glColor3f(0, 0, 1);
    glVertex3f(-0.5, -0.5, 0);

    glEnd();

    HWND hwnd = viewport->GetHandle();
    auto hdc = GetDC(hwnd);
    SwapBuffers(hdc);
    ReleaseDC(hwnd, hdc);
}

// Callback function for resizing the viewport
bool ResizeViewport(const Event& ev, shared_ptr<Object> extra)
{
    // If the window resize event is captured
    auto window = ev.source->As<Window>();

    // Get the new size of the applications window
    iVec2 sz = window->ClientSize();

    auto viewport = extra->As<Window>();

    // Set the position and size of the viewport window
    viewport->SetShape(200, 8, sz.x - 200 - 8, sz.y - 16);
    Render(viewport);

    return true;
}

int main(int argc, const char* argv[])
{
    // Get the available displays
    auto displays = GetDisplays();

    // Create a window
    auto window = CreateWindow("OpenGL Example", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

    // Create user interface
    auto ui = CreateInterface(window);

    // Get the size of the user-interface
    iVec2 sz = ui->root->ClientSize();

    // Create a treeview widget
    auto treeview = CreateTreeView(8, 8, 200 - 16, sz.y - 16, ui->root);

    // Anchor left, top and bottom of treeview widget
    treeview->SetLayout(1, 0, 1, 1);

    // Add nodes to the treeview widget
    treeview->root->AddNode("Object 1");
    treeview->root->AddNode("Object 2");
    treeview->root->AddNode("Object 3");

    // Create a viewport window
    auto viewport = CreateWindow("", 200, 8, sz.x - 200 - 8, sz.y - 16, window, WINDOW_CHILD);

    // Adjust the size of the viewport when the applications window is resized (this will callback to our ResizeViewport() function)
    ListenEvent(EVENT_WINDOWSIZE, window, ResizeViewport, viewport);

    // Initialize an OpenGL context (get a hdc)
    HWND hwnd = (HWND)(viewport->GetHandle());
    HDC hdc = GetDC(hwnd);

    // Specify the format of the default framebuffer
    PIXELFORMATDESCRIPTOR pfd =
    {
        sizeof(PIXELFORMATDESCRIPTOR),
        1,

        // Flags
        PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER,

        // Framebuffer colour format (R, G, B, A)
        PFD_TYPE_RGBA,

        // Framebuffer colour depth (32 bit)
        32,
        0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0, 0, 0, 0,

        // Number of bits for depth-buffer
        24,

        // Number of bits for stencil-buffer
        8,

        // Number of render-targets in default framebuffer
        0,
        PFD_MAIN_PLANE,
        0,
        0, 0, 0
    };

    // Select an appropriate pixel format that is supported by the hdc
    int format = ChoosePixelFormat(hdc, &pfd);

    if (SetPixelFormat(hdc, format, &pfd) == 0)
    {
        RuntimeError("SetPixelFormat() failed.");
    }

    // Create an OpenGL rendering context using our current hdc
    HGLRC glcontext = wglCreateContext(hdc);

    if (glcontext == NULL)
    {
        RuntimeError("wglCreateContext() failed.");
    }

    wglMakeCurrent(hdc, glcontext);

    // Render loop (applications run loop)
    while (true)
    {
        // Check for events
        const Event ev = WaitEvent();

        switch (ev.id)
        {
        case EVENT_WINDOWPAINT:
            if (ev.source == viewport)
            {
                Render(viewport);
            }
            break;

        case EVENT_WINDOWCLOSE:
            if (ev.source == window)
            {
                return 0;
            }
            break;
        }
    }

    return 0;
}
```

You can use these features to create tools that provide a graphical user interface combined with 3D rendering.
