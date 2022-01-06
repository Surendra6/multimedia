<template>
  <div class="text-center text-h5 font-weight-medium pa-5" v-html="label"></div>
</template>

<script>
export default {
  name: "WidgetHeader",

  data: () => ({}),
  props: {
    label: {
      type: String,
      required: true,
    },
  },
};
</script>
