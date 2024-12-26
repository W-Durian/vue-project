<script setup lang="ts">
import { ref } from 'vue'
import MapView from '@/components/MapView.vue'
import { Map } from 'mapbox-gl'
import { MapboxOverlay } from '@deck.gl/mapbox'
import * as deck from 'deck.gl'

const deckOverlay = ref<MapboxOverlay>()

const initMap = async (e: Map) => {
  const { ScatterplotLayer, H3HexagonLayer } = deck
  const overlay = new MapboxOverlay({
    interleaved: true,
    layers: []
  })
  e.addControl(overlay as never)
  overlay.setProps({
    layers: [
      new ScatterplotLayer({
        id: 'circle-01',
        data: [{ position: [113.261503, 23.131377] }],
        getPosition: (d) => d.position,
        getFillColor: [244, 67, 54, 100],
        getRadius: 50000
      }),
      new H3HexagonLayer({
        id: 'H3HexagonLayer',
        data: 'https://raw.githubusercontent.com/visgl/deck.gl-data/master/website/sf.h3cells.json',
        elevationScale: 20,
        extruded: true,
        filled: true,
        getElevation: (d) => d.count,
        getFillColor: (d) => [255, (1 - d.count / 500) * 255, 0],
        getHexagon: (d) => d.hex,
        wireframe: false,
        pickable: true,
        material: true
      })
    ]
  })
  deckOverlay.value = overlay
}
</script>

<template>
  <div class="h-full w-full relative">
    <MapView @initMap="initMap" :pitch="60" :center="[-122.4, 37.74]" />
    <div class="control-panel px-3 py-2">控制面板</div>
  </div>
</template>

<style scoped>
.control-panel {
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: #fff;
  border-radius: var(--el-border-radius-base);
}
</style>
