import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify';

Vue.config.productionTip = false
Vue.prototype.$api_url = "http://localhost:5000"
new Vue({
  vuetify,
  render: h => h(App)
}).$mount('#app')
