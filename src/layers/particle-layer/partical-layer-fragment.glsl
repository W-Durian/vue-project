
#define SHADER_NAME particle-layer-vertex-shader

precision highp float;
in vec4 vColor;
out vec4 vColorOut;

void main(void)
{
  vColorOut = vColor;
  vColorOut = picking_filterHighlightColor(vColorOut);
  vColorOut = picking_filterPickingColor(vColorOut);
}
