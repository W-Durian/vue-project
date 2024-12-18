<script setup lang="ts">
import { ref } from 'vue'
import MapView from '@/components/MapView.vue'
import { Map } from 'mapbox-gl'
import { MapboxOverlay } from '@deck.gl/mapbox'
import { ScatterplotLayer, TextLayer } from '@deck.gl/layers'

const deckOverlay = ref<MapboxOverlay>()

const initMap = (e: Map) => {
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
      new TextLayer({
        id: 'labels',
        data: [{ position: [113.261503, 23.131377] }],
        getText: () => 'test',
        getPosition: (d) => [d.lng, d.lat, d.alt],
        getSize: 16
      })
    ]
  })
  deckOverlay.value = overlay
}
</script>

<template>
  <MapView @initMap="initMap" :pitch="60" />
</template>

<style scoped></style>
