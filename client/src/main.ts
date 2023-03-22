/**
 * main.ts
 *
 * Bootstraps Vuetify and other plugins then mounts the App`
 */

// Components
import App from './App.vue'

// Composables
import { createApp } from 'vue'

// Plugins
import { registerPlugins } from '@/plugins'

import axios from 'axios'
import VueAxios from 'vue-axios'
import 'maz-ui/css/main.css'

const app = createApp(App);

registerPlugins(app);
app.use(VueAxios, axios);

app.mount('#app');
