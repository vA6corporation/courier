require('./bootstrap');
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import { departamentos } from './departamentos.js'
import { provincias } from './provincias.js'
import { distritos } from './distritos.js'
import { ubigeos } from './ubigeos.js'

Vue.mixin({
  data() {
    return {
      departamentos,
      provincias,
      distritos,
      ubigeos,
    }
  }
});

new Vue({
  router,
  render: h => h(App),
}).$mount('#app');