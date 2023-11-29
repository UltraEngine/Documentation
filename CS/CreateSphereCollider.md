```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Example : MonoBehaviour
{
    public GameObject groundPrefab;
    public GameObject modelPrefab;

    private void Start()
    {
        //Create world
        var world = CreateWorld();

        //Create camera
        var camera = CreateCamera(world);
        camera.SetFOV(70);
        camera.Turn(15, 0, 0);
        camera.Move(0, 2, -8);
        camera.SetClearColor(0.125f);

        //Create light
        var light = CreateDirectionalLight(world);
        light.SetRotation(45, 35, 0);

        //Create ground
        var ground = Instantiate(groundPrefab, Vector3.zero, Quaternion.identity);
        ground.transform.localScale = new Vector3(10, 1, 10);
        ground.GetComponent<Renderer>().material.color = Color.green;
        ground.AddComponent<BoxCollider>();

        //Create model
        var model = Instantiate(modelPrefab, Vector3.zero, Quaternion.identity);
        model.transform.localScale = new Vector3(0.5f, 0.5f, 0.5f);
        model.transform.position = new Vector3(0, 5, 0);
        model.transform.rotation = Quaternion.Euler(90, 10, 0);
        model.GetComponent<Renderer>().material.color = Color.blue;
        var rigidbody = model.AddComponent<Rigidbody>();
        rigidbody.mass = 1;
        rigidbody.AddForce(100, 0, 0);

        //Create collision
        var collision = model.AddComponent<SphereCollider>();
        collision.radius = 0.5f;
    }

    private void Update()
    {
        //
    }
}
```