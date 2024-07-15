shader_type canvas_item;

// A variável de progresso controla o tamanho do coração (0.0 a 1.0)
uniform float progress : hint_range(0.0, 1.0);

// Centro do coração na tela (proporção da tela)
uniform vec2 heart_center = vec2(1, 1);

// Tamanho do coração
uniform float heart_size = 1.0;

// Função para verificar se um ponto está dentro do coração
float inHeart(vec2 p, vec2 center, float size) {
    if (size == 0.0) return 0.0;
    vec2 o = (p - center) / (1.6 * size);
    float a = o.x * o.x + o.y * o.y - 0.3;
    return step(a * a * a, o.x * o.x * o.y * o.y * o.y);
}

void fragment() {
    // Coordenadas normalizadas do fragmento
    vec2 uv = FRAGCOORD.xy / SCREEN_PIXEL_SIZE;

    // Cor de origem e cor de destino (podem ser substituídas por texturas ou cores específicas)
    vec4 color1 = vec4(1.0, 0.0, 0.0, 1.0); // Vermelho
    vec4 color2 = vec4(0.0, 0.0, 0.0, 0.0); // Azul

    // Mistura as duas cores com base na presença no coração
    vec4 result = mix(color1, color2, inHeart(uv, heart_center, progress * heart_size));

    // Define a cor do fragmento
    COLOR = result;
}
