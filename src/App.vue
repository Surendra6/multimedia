<template>
  <v-app>
    <MultimediaLobby />

    <v-btn
      href="https://github.com/Surendra6/multimedia/tree/main"
      target="_blank"
      class="accent--text"
      fab
      large
      bottom
      right
      fixed
    >
      <v-icon>mdi-github</v-icon>
    </v-btn>
  </v-app>
</template>

<script>
import MultimediaLobby from "./components/MultimediaLobby";

export default {
  name: "App",

  components: {
    MultimediaLobby,
  },

  data: () => ({
    //
  }),
};
</script>
