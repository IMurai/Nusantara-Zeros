shader_type canvas_item;

uniform vec4 warna_atas : source_color = vec4(1.0, 0.9, 0.0, 1.0);
uniform vec4 warna_bawah : source_color = vec4(1.0, 0.35, 0.0, 1.0);

// Isi ini sesuai tinggi Label kamu di Inspector (dalam piksel)
uniform float tinggi : hint_range(1.0, 1000.0) = 100.0;

// "Jembatan" untuk kirim posisi dari vertex ke fragment
varying float pos_y;

void vertex() {
    // Ambil posisi Y lokal tiap sudut huruf
    pos_y = VERTEX.y;
}

void fragment() {
    vec4 teks_asli = texture(TEXTURE, UV);

    // Hitung gradasi berdasarkan posisi Y yang sebenarnya
    float t = clamp(pos_y / tinggi, 0.0, 1.0);
    vec4 warna_gradasi = mix(warna_atas, warna_bawah, t);

    COLOR = vec4(warna_gradasi.rgb, teks_asli.a);
}