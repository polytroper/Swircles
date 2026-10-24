// Shadergator first shader practice
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec3 paint = vec3(0, (sin(iTime)+1.0)/2.0, 1);
    vec2 uv = fragCoord / iResolution.xy;
    vec2 center = vec2(0.5+0.2*sin(iTime), 0.5);
    vec2 uvp = vec2(uv.x%0.1, )

    vec2 point = (uv-center) * vec2(iResolution.x/iResolution.y, 1.0);
    float circle = 1.0 - smoothstep(0.24, 0.25, length(point));
    fragColor = vec4(paint*circle, 1.0);
}
