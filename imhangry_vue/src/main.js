//Vue.js預設css 不要用會爆炸
// import './assets/main.css'


//import套件
import { createApp } from 'vue'
import { createPinia } from 'pinia'

//import檔案
import App from './App.vue'
import router from './router/router'
import ElementPlus from 'element-plus'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import 'element-plus/dist/index.css'
import FontAwesomeIcon from './plugin/fontawesome'
// import 'bootstrap/dist/css/bootstrap.min.css';
// import 'bootstrap/dist/js/bootstrap.bundle.min.js';
    

//執行生效
const app = createApp(App)
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}
app.use(createPinia())
app.use(router)
app.use(ElementPlus)
app.component('font-awesome-icon', FontAwesomeIcon)
app.mount('#app')
