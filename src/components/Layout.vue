<script setup lang="ts">
import { ref } from 'vue'
import Menu from '@/components/Menu.vue'

interface Menu {
  id: string
  title: string
  path: string
  level: number
  icon?: string
  children?: Menu[]
  [key: string]: string | number | Menu[] | undefined
}

const menus = ref<Menu[]>([
  { id: '1', title: '个人简历', path: '/', level: 1, icon: 'User' },
  {
    id: '2',
    title: '地图知识',
    path: '/map',
    level: 1,
    icon: 'Location'
  },
  { id: '3', title: '前端资料', path: '/', level: 1, icon: 'Document' },
  { id: '4', title: '其他资料', path: '/', level: 1, icon: 'Guide' }
])
const collapse = ref(true)
</script>

<template>
  <div class="outer-layout">
    <el-container class="outer-container">
      <el-aside :width="collapse ? '64px' : '240px'" class="outer-aside bg-purple-700">
        <div class="p-3">
          <div class="logo w-full flex justify-center">
            <img width="128" src="@/assets/images/logo.svg" alt="logo" />
          </div>
          <div class="logo-title my-3 text-2xl" v-if="!collapse">WDurian@绵阳岛</div>
        </div>
        <el-scrollbar class="flex-1 mt-10">
          <el-menu
            style="border-right: none"
            :collapse="collapse"
            class="outer-menu"
            mode="vertical"
            active-text-color="#ffd04b"
            background-color="#7e22ce"
            default-active="2"
            text-color="#fff"
            :router="true"
          >
            <Menu :menus="menus" />
          </el-menu>
        </el-scrollbar>
      </el-aside>
      <el-container>
        <el-header class="flex items-center">
          <img width="48" src="@/assets/images/tanghulu.svg" alt="" />
          <div class="header-desc ms-auto text-purple-700 flex items-center">
            <span>欢迎访问绵阳岛！</span>
            <img width="48" src="@/assets/images/beike.svg" alt="" />
          </div>
        </el-header>
        <el-main class="bg-gray-100">
          <el-card
            class="w-full h-full"
            shadow="never"
            :body-style="{
              height: '100%',
              padding: 0
            }"
            ><router-view
          /></el-card>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<style scoped>
.outer-layout,
.outer-container {
  height: 100%;
}

.logo-title {
  font-family: 'ZiHunTianTianQuan';
  color: #fff;
  text-align: center;
}

.header-desc {
  font-family: 'ZiHunTianTianQuan';
  font-size: 1.25rem;
}

.outer-aside {
  position: relative;
  display: flex;
  flex-direction: column;
}

.collapse-btn {
  position: absolute;
  top: 20%;
  right: 0;
  transform: translateX(100%);
  z-index: 100;
}
</style>
