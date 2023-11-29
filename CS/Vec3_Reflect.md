```csharp
using System;
using UltraEngine;

class Game
{
    static void Main(string[] args)
    {
        //The motion is pointing down and forward
        Vec3 motion = new Vec3(0, -1, 1);
        
        //The ground is pointing up
        Vec3 ground = new Vec3(0, 1, 0);
        
        //Calculate bounce angle
        Vec3 bounce = motion.Reflect(ground);
        
        //The bounce angle should be up and forward
        Console.WriteLine(bounce.x + ", " + bounce.y + ", " + bounce.z);
    }
}
```