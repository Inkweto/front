<template>
  <v-app>
    <v-app-bar
      app
      color="dark"
      dark
    >
      <div class="d-flex align-center">
        <v-img
          :src="require('./assets/logo.png')"
          class="shrink mr-2"
          contain
          transition="scale-transition"
          width="40"
        />

        LogSearch
      </div>

      <v-spacer></v-spacer>

      <v-btn
        href="https://github.com/Inkweto/front"
        target="_blank"
        text
      >
        <span class="mr-2">Github</span>
        <v-icon>mdi-open-in-new</v-icon>
      </v-btn>
    </v-app-bar>

    <v-main>
      <HelloWorld/>
    </v-main>
    <v-footer app color="dark" dark>    
      <v-icon class="mr-1">mdi-copyright</v-icon>  2021 Inkweto
    </v-footer>
  </v-app>
</template>

<script>
import HelloWorld from './components/HelloWorld';

export default {
  name: 'App',

  components: {
    HelloWorld,
  },

  data: () => ({
    //
  }),
};
</script>
