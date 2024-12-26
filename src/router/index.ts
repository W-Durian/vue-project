import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/map',
      name: 'map',
      component: () => import('@/views/mapboxgl/Index.vue')
    },
    {
      path: '/webgl',
      name: 'webgl',
      component: () => import('@/views/webgl/Index.vue'),
      children: [
        {
          path: ':id',
          name: 'webglDetail',
          component: () => import('@/views/webgl/Detail.vue')
        }
      ]
    }
  ]
})

export default router
