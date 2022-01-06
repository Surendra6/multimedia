<template>
  <v-sheet>
    <WidgetHeader label="Youtube Video" />
    <div id="player"></div>
  </v-sheet>
</template>

<script>
import WidgetHeader from "./WidgetHeader.vue";
export default {
  name: "VideoYT",
  components: {
    WidgetHeader,
  },
  data: () => ({
    player: null,
  }),
  methods: {
    initYoutube() {
      this.player = new window.YT.Player("player", {
        width: "90%",
        height: 250,

        playerVars: { autoplay: 0, controls: 1, mute: 0 },
        videoId: "FAtdv94yzp4",
        events: {
          onReady: this.onPlayerReady,
          onStateChange: this.onPlayerStateChange,
        },
      });
    },
    onPlayerReady(evt) {
      console.log("Ready");
      evt.target.playVideo();
    },
    onPlayerStateChange(evt) {
      console.log("Player state changed", evt);
    },
    loadScript() {
      if (
        typeof window.YT == "undefined" ||
        typeof window.YT.Player == "undefined"
      ) {
        var tag = document.createElement("script");
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName("script")[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
      }
    },
    loadPlayer() {
      window.onYouTubePlayerAPIReady = () => {
        this.initYoutube();
      };
    },
  },
  mounted() {
    this.loadScript();
    this.loadPlayer();
  },
};
</script>
