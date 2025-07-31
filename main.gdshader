shader_type canvas_item;

uniform float x1 = 200.0;
uniform float x2 = 1000.0;
uniform vec2 viewport_size = vec2(1280.0, 960.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float screen_x = SCREEN_UV.x * viewport_size.x;
	if (screen_x < x1 || screen_x > x2) {
		discard;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
