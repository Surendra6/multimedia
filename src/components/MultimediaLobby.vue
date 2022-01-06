<template>
  <v-sheet height="100%" class="grey lighten-4 pa-5">
    <v-container max-width="80%">
      <v-row class="d-flex justify-space-around">
        <v-col cols="6" class="text-center pr-5">
          <v-card class="card"><VideoYT /></v-card>
        </v-col>
        <v-col cols="6" class="text-center pl-5">
          <v-card class="card"><AudioPlayer /></v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-sheet>
</template>

<script>
import VideoYT from "./VideoYT.vue";
import AudioPlayer from "./AudioPlayer.vue";
export default {
  name: "MultimediaLobby",

  data: () => ({}),
  components: {
    VideoYT,
    AudioPlayer,
  },
};
</script>
<style lang="scss" scoped>
.card {
  height: 350px;
}
</style>
