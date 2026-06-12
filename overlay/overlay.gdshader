shader_type spatial;
render_mode unshaded, fog_disabled;

uniform sampler2D screen_texture : hint_screen_texture;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 nc = vec2(SCREEN_UV.g, SCREEN_UV.r);
	
	vec4 color = texture(screen_texture, nc);
	
	
	ALBEDO = color.rgb;
	
	float distance_to_center = length(vec2(0.5, 0.5) - UV);
    
    // Calculate alpha using smoothstep to create a fade effect
	float alpha = smoothstep(0.2, 1, distance_to_center);
    //float alpha = step(distance_to_center, 0.5);
    
    if (alpha >= 0.3) {
        discard;
    }
	if(alpha > 0.2) alpha = 0.0;

	//if(alpha > 0.5) alpha = 1.0;
	
    // Set the alpha value
    ALPHA = 1.0 - alpha;
//
    //// Discard the fragment if alpha is zero
	
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
