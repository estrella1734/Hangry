<template>
    <div class="block text-center">
    
      <el-carousel height="360px" arrow="never" :autoplay="false" indicator-position="none">
        <el-carousel-item v-for="item in 4" :key="item">
          <img src="../../../../orderPageImage/HangryBanner.png" alt="">
        </el-carousel-item>
      </el-carousel>
    </div>
  
  </template>
  
  <style scoped>

  .demonstration {
    color: var(--el-text-color-secondary);
  }
  
  .el-carousel__item img {
    width: 100%;
    /* height: 350px; */
    /* border-radius:0 10px 10px 0; */
  }

  /* .el-carousel__item,.is-animating,.is-active{
    border-radius:0 10px 10px 0
  } */
  
  /* .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  } */
  
  /* .el-carousel__item:nth-child(2n + 1) {
    background-color: #d3dce6;
  } */
  .el-carousel__item img[data-v-159355c9] {
    width: 100%;
    height: 360px;
  }
  </style>
  