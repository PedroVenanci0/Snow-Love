// Rain and Snow shader by Brian Smith (steampunkdemon.itch.io)
// MIT licence

shader_type canvas_item;

uniform float snow_amount = 200.0;
uniform float near_snow_length : hint_range(0.01, 1.0) = 0.005;
uniform float far_snow_length : hint_range(0.01, 1.0) = 0.005;
uniform float near_snow_width : hint_range(0.1, 1.0) = 0.8;
uniform float far_snow_width : hint_range(0.1, 1.0) = 0.6;
uniform float near_snow_transparency : hint_range(0.1, 1.0) = 1.0;
uniform float far_snow_transparency : hint_range(0.1, 1.0) = 0.8;
// Replace the below reference to source_color with hint_color if you are using a version of Godot before 4.0.
uniform vec4 snow_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float base_snow_speed : hint_range(0.1, 1.0) = 0.01;
uniform float additional_snow_speed : hint_range(0.1, 1.0) = 0.08;
uniform float slant : hint_range(-1.0, 1.0) = 0.2;

void fragment() {
    // To control the snowfall from your program comment out the below line and add a new uniform above as:
    // uniform float time = 10000.0;
    // Then update the time uniform from your _physics_process function by adding delta. You can then pause the snowfall by not changing the time uniform.
    float time = 10000.0 + TIME;

    // Uncomment the following line if you are applying the shader to a TextureRect and using a version of Godot before 4.0.
    // COLOR = texture(TEXTURE, UV);

    vec2 uv = vec2(0.0);
    float remainder = mod(UV.x - UV.y * slant, 1.0 / snow_amount);
    uv.x = (UV.x - UV.y * slant) - remainder;
    float rn = fract(sin(uv.x * snow_amount));
    uv.y = fract((UV.y + rn));

    // No trail. Works well for snow:
    COLOR = mix(COLOR, snow_color, step(1.0 - (far_snow_length + (near_snow_length - far_snow_length) * rn), fract(uv.y - time * (base_snow_speed + additional_snow_speed * rn))) * (far_snow_transparency + (near_snow_transparency - far_snow_transparency) * rn) * step(remainder * snow_amount, far_snow_width + (near_snow_width - far_snow_width) * rn));
}
