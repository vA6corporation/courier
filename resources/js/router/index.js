import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'provincial',
    component: require('@/views/Provincial').default
  },
  {
    path: '/express',
    name: 'express',
    component: require('@/views/Express').default
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
