
<template>
    <div class="container">
        <form @submit.prevent="updateHeadShot" enctype="multipart/form-data">
            <div class="mb-3 ">
                <div>
                    <label for="fileInput" class="custom-file-upload ">
                        <img v-if="props.image" :src="previewImage || 'data:image/jpeg;base64,' + props.image">
                        <img v-if="!props.image" src="/orderPageImage/Hangry.jpg">
                        <p style="margin-left: 80px; margin-top:20px;">點擊照片選擇檔案</p>
                    </label>
                </div>
                <input type="file" class="form-control" id="fileInput" ref="fileInput" accept="image/*"
                    @change="previewFile">
                <button class="btn btn-primary" type="submit" style="margin-left: 100px;">Save
                    Change</button>
            </div>
        </form>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import axios from 'axios';
import Swal from 'sweetalert2';
import { getCookieData } from '../sean/util/Gettes'

const props = defineProps(['image']);
const userData = getCookieData('userData');
const id = userData.id;
const fileInput = ref(null); // 使用者原本的照片
const previewImage = ref(null);
const previewFile = () => {
    const file = fileInput?.value?.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = () => {
            previewImage.value = reader.result;
        };
        reader.readAsDataURL(file);
    }
}

const updateHeadShot = async () => {
    const file = fileInput?.value?.files[0];
    const formData = new FormData();
    if (file) {
        formData.append('avatar', file);
    }
    const path = import.meta.env.VITE_API_GUESTUSERURL;
    const API_URL = `${path}/updateHeadShot/${id}`;
    try {
        const response = await axios.put(API_URL, formData, {
            withCredentials: true
        });
        const data = response.data;

        if (response.status === 201) {
            Swal.fire({
                title: '照片修改成功',
                icon: 'success',
                showConfirmButton: false,
                allowOutsideClick: false,
                timer: 1500,
            }).then(() => {
                location.reload();
            });
        } else {
            throw new Error(data);
        }
    } catch (error) {
        if (error.response) {
            Swal.fire({
                title: '照片修改失敗',
                text: error.response.data,
                icon: 'error',
                allowOutsideClick: false,
            });
        } else {
            Swal.fire({
                title: '照片修改失敗',
                text: error.message,
                icon: 'error',
                allowOutsideClick: false,
            });
        }

    }
}
</script>

<style scoped>
input[type="file"] {
    display: none;
}

/* 自訂樣式 */
.custom-file-upload {
    border: 1px solid #ccc;
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
    border-radius: 4px;
    border: none;
}

img {
    width: 300px;
    height: 300px;
    border-radius: 50%;
    /* 使圖片成為圓形 */
    object-fit: cover;
    /* 確保圖片填滿整個圓形區域 */
}

.container {
    padding: 25px;
    margin: 0;
}
</style>