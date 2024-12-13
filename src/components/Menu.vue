<script setup lang="ts">
interface Menu {
  id: string
  title: string
  path: string
  children?: Menu[]
  [key: string]: string | number | Menu[] | undefined
}
// defineProps<{
//   menus: Menu[]
// }>({
//   menus: () => []
// })
const { menus } = defineProps(['menus'])
</script>

<template>
  <template v-for="menu in menus" :key="menu.id">
    <el-sub-menu v-if="menu.children && menu.children.length > 0">
      <template #title>{{ menu.title }}</template>
      <Menu :menus="menu.children" />
    </el-sub-menu>
    <el-menu-item v-else :index="menu.path">
      {{ menu.title }}
    </el-menu-item>
  </template>
</template>

<style scoped></style>
