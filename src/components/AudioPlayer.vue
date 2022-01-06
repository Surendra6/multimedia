<template>
  <v-container>
    <WidgetHeader label="Audio Player" />
    <v-sheet
      class="mx-auto text-center d-flex font-color"
      color="#26c6da"
      height="250"
    >
      <div>
        <div class="subtitle-1 font-weight-bold pt-5">
          {{ audioFile.title }}
        </div>
        <div class="subtitle-2 font-weight-light pb-2">
          {{ audioFile.artist }}
        </div>
        <div>
          <v-btn
            class="mx-2"
            fab
            small
            color="cyan lighten-4"
            @click="previousTrack"
            :disabled="isPreviousDisable"
          >
            <v-icon dark> mdi-skip-previous </v-icon>
          </v-btn>
        </div>
        <div class="pa-2">
          <audio controls id="audio-player">
            <source :src="audioFile.url" type="audio/mp3" />
            Your browser does not support the audio tag.
          </audio>
        </div>
        <div>
          <v-btn
            class="mx-2"
            fab
            small
            color="cyan lighten-4"
            @click="nextTrack"
            :disabled="isNextDisable"
          >
            <v-icon dark> mdi-skip-next </v-icon>
          </v-btn>
        </div>
      </div>
      <v-divider :vertical="true" color="#E0F7FA"></v-divider>
      <div class="text-left flex-grow-1 track-list">
        <div
          v-for="(audio, index) in audioPlaylist"
          :key="`track-${index}`"
          :class="[
            'pa-2',
            'track',
            'd-flex',
            'justify-space-between',
            { selected: currentAudioIndex === index },
          ]"
        >
          <div>
            <div class="subtitle-2 wrap-text">{{ audio.title }}</div>
            <div class="caption wrap-text">{{ audio.artist }}</div>
          </div>

          <v-btn fab x-small color="cyan lighten-4" @click="selectTrack(index)">
            <v-icon> {{ togglePlayPauseIcon(index) }}</v-icon>
          </v-btn>
        </div>
      </div>
    </v-sheet>
  </v-container>
</template>

<script>
import WidgetHeader from "./WidgetHeader.vue";
export default {
  name: "AudioPlayer",
  components: {
    WidgetHeader,
  },
  data: () => ({
    audio: null,
    audioFile: "",
    isPlaying: false,
    isTracksLoop: false,
    currentAudioIndex: 0,
    audioPlaylist: [
      {
        title: "Water drops",
        artist: "Daniel Simion",
        url: "http://soundbible.com/mp3/water-drops-daniel_simon.mp3",
      },
      {
        title: "Seagulls",
        artist: "Daniel Simion",
        url: "http://soundbible.com/mp3/flock-of-seagulls_daniel-simion.mp3",
      },
      {
        title: "Bike sound",
        artist: "Daniel Simion",
        url: "https://soundbible.com/mp3/harley-davidson-daniel_simon.mp3",
      },
      {
        title: "Rain",
        artist: "Daniel Simion",
        url: "https://soundbible.com/mp3/heavy-rain-daniel_simon.mp3",
      },
      {
        title: "Type Writer",
        artist: "Daniel Simion",
        url: "http://soundbible.com/mp3/electric-typewriter-daniel_simon.mp3",
      },
      {
        title: "Waterfall",
        artist: "Daniel Simion",
        url: "https://soundbible.com/mp3/large_waterfall_1-daniel_simon.mp3",
      },
    ],
  }),
  computed: {
    isPreviousDisable() {
      return !this.isTracksLoop && this.currentAudioIndex === 0;
    },
    isNextDisable() {
      return (
        !this.isTracksLoop &&
        this.currentAudioIndex === this.audioPlaylist.length - 1
      );
    },
  },
  methods: {
    nextTrack() {
      if (this.currentAudioIndex < this.audioPlaylist.length - 1) {
        this.currentAudioIndex = this.currentAudioIndex + 1;
        this.loadTrack();
      }
    },
    previousTrack() {
      if (this.currentAudioIndex > 0) {
        this.currentAudioIndex = this.currentAudioIndex - 1;
        this.loadTrack();
      }
    },
    loadTrack() {
      this.audioFile = this.audioPlaylist[this.currentAudioIndex];
      this.audio.src = this.audioFile.url;
      this.audio.play();
    },
    togglePlayPause() {
      if (this.isPlaying) {
        this.audio.pause();
      } else {
        this.audio.play();
      }
    },
    selectTrack(index) {
      if (this.currentAudioIndex === index) {
        this.isPlaying = !this.isPlaying;
        this.togglePlayPause();
      } else {
        this.currentAudioIndex = index;
        this.loadTrack();
      }
    },
    togglePlayPauseIcon(index) {
      let icon = "";
      if (this.currentAudioIndex === index) {
        if (this.isPlaying) {
          icon = "mdi-play-circle";
        } else {
          icon = "mdi-pause-circle";
        }
      } else {
        icon = "mdi-play-circle";
      }
      return icon;
    },
  },
  mounted() {
    this.audioFile = this.audioPlaylist[this.currentAudioIndex];
    this.audio = document.querySelector("#audio-player");
  },
};
</script>

<style lang="scss" scoped>
.font-color {
  color: #e0f7fa;
}

.track-list {
  overflow: hidden;
  overflow-y: auto;
  height: 100%;

  .track {
    border-bottom: 1px solid #e0f7fa;

    .wrap-text {
      overflow: hidden;
      width: 150px;
      white-space: nowrap;
      text-overflow: ellipsis;
    }
  }

  .selected {
    color: #ffe0b2;
  }
}

/* width */
::-webkit-scrollbar {
  width: 5px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #26c6da;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #888;
  border-radius: 4px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555;
}
</style>
