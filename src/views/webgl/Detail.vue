<script setup lang="ts">
import { onMounted, ref } from 'vue'
import MapView from '@/components/MapView.vue'
import { Map } from 'mapbox-gl'
import * as deck from 'deck.gl'
import { MapboxOverlay } from '@deck.gl/mapbox'

const { SimpleMeshLayer } = deck
const map = ref<Map>()

const initMap = (e) => {
  map.value = e
  const meshLayer = handleMeshLayer()
  console.log(meshLayer)
  const overlay = new MapboxOverlay({
    interleaved: true,
    layers: [meshLayer]
  })
  e.addControl(overlay)
}

const handleMeshLayer = () => {
  const SIZE = 1000
  const vertexData = new Float32Array([-SIZE, -SIZE, 0, SIZE, -SIZE, 0, -SIZE, SIZE, 0, SIZE, SIZE, 0])
  const indexData = new Uint16Array([0, 1, 2, 1, 3, 2])

  // 定义着色器代码
  const vs = `\
  attribute vec3 positions;
  uniform mat4 modelViewProjectionMatrix;
  void main() {
    gl_Position = modelViewProjectionMatrix * vec4(positions, 1.0);
  }
  `

  const fs = `\
  void main() {
    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0); // 红色
  }
  `
  return new SimpleMeshLayer({
    id: 'mesh-layer',
    mesh: {
      vertices: vertexData,
      indices: indexData,
      attributes: {
        colors: new Float32Array([1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1])
      }
    },
    sizeScale: 1000,
    shaders: { vs, fs },
    parameters: {
      depthTest: false
    }
  })
}

onMounted(() => {})
</script>

<template>
  <MapView @initMap="initMap" :center="[-122.45, 37.75]" :zoom="12" />
</template>

<style scoped></style>
