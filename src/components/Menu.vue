<script setup lang="ts">
import Menu from '@/components/Menu.vue'

const props = defineProps(['menus'])
</script>

<template>
  <template v-for="menu in props.menus" :key="menu.id">
    <el-sub-menu v-if="menu.children && menu.children.length > 0">
      <template #title>
        <el-icon v-if="menu.level === 1">
          <component :is="menu.icon" />
        </el-icon>
        <span>{{ menu.title }}</span>
      </template>
      <Menu :menus="menu.children" />
    </el-sub-menu>
    <el-menu-item v-else :route="menu.path" :index="menu.id">
      <el-icon v-if="menu.level === 1">
        <component :is="menu.icon" />
      </el-icon>
      <span>{{ menu.title }}</span>
    </el-menu-item>
  </template>
</template>

<style scoped></style>
