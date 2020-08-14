<template>
  <div>
    <ul>
      <li v-for="board in boards">{{ board }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      boards: [],
    }
  }
}
</script>

