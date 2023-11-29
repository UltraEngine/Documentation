# Window.GetPosition

This method returns the position of a window in screen coordinates.

## Syntax

- [Vector2](https://docs.microsoft.com/en-us/dotnet/api/system.windows.vector) **GetPosition**()

## Returns

Returns the window position.

## Example

```csharp
using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;

public class Game1 : Game
{
    GraphicsDeviceManager graphics;
    SpriteBatch spriteBatch;

    Vector2 windowPosition;

    public Game1()
    {
        graphics = new GraphicsDeviceManager(this);
        Content.RootDirectory = "Content";
    }

    protected override void Initialize()
    {
        //Create window
        Window.Position = Point.Zero;

        //Create user interface
        //TODO: Create UI

        base.Initialize();
    }

    protected override void LoadContent()
    {
        spriteBatch = new SpriteBatch(GraphicsDevice);

        //Display window position
        var label = new Label();
        //TODO: Set label properties
        label.Text = "Window position: " + windowPosition.X + " x " + windowPosition.Y;
        //TODO: Add label to UI

        base.LoadContent();
    }

    protected override void Update(GameTime gameTime)
    {
        //Get window position
        windowPosition = Window.Position.ToVector2();

        base.Update(gameTime);
    }

    protected override void Draw(GameTime gameTime)
    {
        GraphicsDevice.Clear(Color.CornflowerBlue);

        spriteBatch.Begin();
        //TODO: Draw UI
        spriteBatch.End();

        base.Draw(gameTime);
    }

    static void Main(string[] args)
    {
        using (var game = new Game1())
        {
            game.Run();
        }
    }
}
```