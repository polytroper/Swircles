// Shadergator first shader practice
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec4 paint = vec4(0, 1, 1, 1);
    vec2 uv = fragCoord / iResolution.xy;
    vec2 point = (uv-0.5) * vec2(iResolution.x/iResolution.y, 1.0);
    float circle = 1.0 - smoothstep(0.24, 0.25, length(point));
    fragColor = vec4(paint*circle);
}
