<script setup lang="ts">
import { ref } from 'vue'

const menus = ref<Menu[]>([
  { id: '1', title: '个人简历', path: '/' },
  {
    id: '2',
    title: '地图知识',
    path: '/',
    children: [
      { id: '2-1', title: 'mapbox-gl', path: '/' },
      { id: '2-2', title: 'webgl', path: '/' }
    ]
  },
  { id: '3', title: '前端资料', path: '/' },
  { id: '4', title: '其他资料', path: '/' }
])

interface Menu {
  id: string
  title: string
  path: string
  children?: Menu[]
  [key: string]: string | number | Menu[] | undefined
}
</script>

<template>
  <div class="outer-layout">
    <el-container class="outer-container h-full">
      <el-aside width="252px" class="outer-aside bg-purple-700">
        <div class="p-3">
          <div class="logo w-full flex justify-center">
            <img width="128" src="@/assets/images/logo.svg" alt="logo" />
          </div>
          <div class="logo-title my-3 text-2xl">WDurian@绵阳岛</div>
        </div>

        <el-menu
          class="outer-menu"
          mode="vertical"
          active-text-color="#ffd04b"
          background-color="#7e22ce"
          default-active="2"
          text-color="#fff"
          router
        >
          <Menu :menus="menus" />

          <!--          <template v-for="menu in menus" :key="menu.id">-->
          <!--            <el-menu-item v-if="!menu.children || menu.children.length === 0" :index="menu.path">-->
          <!--              {{ menu.title }}-->
          <!--            </el-menu-item>-->
          <!--            <el-sub-menu v-else :index="menu.id">-->
          <!--              <template #title>-->
          <!--                <span>{{ menu.title }}</span>-->
          <!--              </template>-->
          <!--            </el-sub-menu>-->
          <!--          </template>-->
          <!--          <el-sub-menu index="1">-->
          <!--            <template #title>-->
          <!--              <span>地图</span>-->
          <!--            </template>-->
          <!--            <el-menu-item-group title="Group One">-->
          <!--              <el-menu-item index="1-1">item one</el-menu-item>-->
          <!--              <el-menu-item index="1-2">item two</el-menu-item>-->
          <!--            </el-menu-item-group>-->
          <!--            <el-menu-item-group title="Group Two">-->
          <!--              <el-menu-item index="1-3">item three</el-menu-item>-->
          <!--            </el-menu-item-group>-->
          <!--            <el-sub-menu index="1-4">-->
          <!--              <template #title>item four</template>-->
          <!--              <el-menu-item index="1-4-1">item one</el-menu-item>-->
          <!--            </el-sub-menu>-->
          <!--          </el-sub-menu>-->
          <!--          <el-menu-item index="2">-->
          <!--            <el-icon><icon-menu /></el-icon>-->
          <!--            <span>Navigator Two</span>-->
          <!--          </el-menu-item>-->
          <!--          <el-menu-item index="3" disabled>-->
          <!--            <el-icon><document /></el-icon>-->
          <!--            <span>Navigator Three</span>-->
          <!--          </el-menu-item>-->
          <!--          <el-menu-item index="4">-->
          <!--            <el-icon><setting /></el-icon>-->
          <!--            <span>Navigator Four</span>-->
          <!--          </el-menu-item>-->
        </el-menu>
      </el-aside>
      <el-container>
        <el-header>Header</el-header>
        <el-main>Main</el-main>
      </el-container>
    </el-container>
  </div>
</template>

<style scoped>
.outer-layout {
  height: 100%;
  overflow: hidden;
}
.logo-title {
  font-family: 'ZiHunTianTianQuan';
  color: #fff;
  text-align: center;
}
</style>
