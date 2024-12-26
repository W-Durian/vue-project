<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { Deck, H3HexagonLayer, type DeckProps, ScatterplotLayer } from 'deck.gl'

const deckRef = ref<HTMLDivElement>()

const createDeck = () => {
  const props: DeckProps = {
    id: 'map',
    initialViewState: {
      longitude: -122.4,
      latitude: 37.74,
      zoom: 11,
      maxZoom: 20,
      pitch: 30,
      bearing: 0
    },
    controller: true,
    layers: [
      new ScatterplotLayer({
        data: [{ position: [-122.45, 37.8], color: [255, 0, 0], radius: 100 }],
        getPosition: (d) => d.position,
        getFillColor: (d) => d.color,
        getRadius: (d) => d.radius
      }),
      new H3HexagonLayer({
        data: 'https://raw.githubusercontent.com/visgl/deck.gl-data/master/website/sf.h3cells.json',
        getHexagon: (d) => d.hex,
        elevationScale: 100,
        coverage: 1,
        extruded: true,
        wireframe: true,
        filled: true,
        lineWidthMinPixels: 1,
        getElevation: (d) => d.count,
        getFillColor: [255, 140, 0, 140],
        getLineColor: [0, 0, 0]
      })
    ]
  }
  const deckInstance = new Deck(props)
  console.log(deckInstance)
  return deckInstance
}

onMounted(() => {
  createDeck()
})
</script>

<template>
  <canvas id="map" ref="deckRef" class="w-full h-full"></canvas>
</template>

<style scoped></style>
