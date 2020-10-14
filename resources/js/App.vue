<template>
  <div class="container">
    <div class="row form-group lead pt-5">
      <div class="col">
        <router-link to="/">Provincial</router-link>
      </div>
      <div class="col">
        <router-link to="/express">Express</router-link>
      </div>
      <div class="col"></div>
    </div>
    <router-view></router-view>
  </div>
</template>

<script>
export default {

}
</script>

<style>

</style>