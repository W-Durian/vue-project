<script setup lang="ts">
import { onMounted, onUnmounted, ref } from 'vue'
import { LngLat, Map } from 'mapbox-gl'

const props = defineProps({
  center: LngLat,
  zoom: Number,
  pitch: Number
})
const emits = defineEmits(['initMap'])
const mapRef = ref<Map>()

const createMap = () => {
  const map = new Map({
    accessToken: import.meta.env.VITE_MAPBOX_ACCESS_TOKEN,
    container: 'map',
    style: 'mapbox://styles/mapbox/satellite-v9',
    attributionControl: false,
    logoPosition: 'bottom-right',
    bearing: 0,
    preserveDrawingBuffer: true,
    center: props.center || [113.261503, 23.131377],
    zoom: props.zoom || 7,
    pitch: props.pitch || 0
  })
  map.once('load', () => {
    mapRef.value = map
    emits('initMap', map)
  })
}

onMounted(() => {
  createMap()
})
onUnmounted(() => {
  mapRef.value?.remove()
})
</script>

<template>
  <div id="map" class="w-full h-full"></div>
</template>

<style scoped></style>
