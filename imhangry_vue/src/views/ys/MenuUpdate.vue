<template>
    <div>
        <br>
        <h2>修改商品{{ $route.params.id }}</h2>
        <br>
    </div>
    <div class="card">
        <br>
        <el-form :model="form" label-width="120px" class="form">
            <el-form-item label="商品名稱">
                <el-input v-model="form.name" clearable />
            </el-form-item>
            <el-form-item label="商品名稱(英)">
                <el-input v-model="form.engName" clearable />
            </el-form-item>
            <el-form-item label="售價">
                <el-input-number v-model="form.price" :min="0" :max="100000"
                    @change="handleChange" />&nbsp元&nbsp(上限:100,000)
            </el-form-item>
            <el-form-item label="商品分類">
                <el-select v-model="form.fkCategoryId" placeholder="請選擇分類 ">
                    <el-option label="QQ珍珠" value="1" />
                    <el-option label="花花草草" value="2" />
                    <el-option label="健康水果" value="3" />
                </el-select>
            </el-form-item>
            <el-form-item label="商品狀態">
                <el-select v-model="form.status" placeholder="請選擇狀態 ">
                    <el-option label="銷售中" value="1" />
                    <el-option label="已售完" value="2" />
                    <el-option label="準備中" value="3" />
                </el-select>
            </el-form-item>
            <el-form-item label="商品描述">
                <el-input v-model="form.description" type="textarea" />
            </el-form-item>
            <el-form-item label="照片上傳">
                <el-upload ref="uploadImage" :beforeUpload="beforeUploadPicture" :on-change="imageChange"
                    list-type="picture-card" name="files" :limit="3" multiple :auto-upload="false"
                    :on-preview="handlePictureCardPreview" :on-remove="handleRemovePicture">
                    <el-icon>
                        <Plus />
                    </el-icon>

                    <template #file="{ file }">
                        <div>
                            <img class="el-upload-list__item-thumbnail" :src="file.url" alt="" />
                            <span class="el-upload-list__item-actions">
                                <span class="el-upload-list__item-preview" @click="handlePictureCardPreview(file)">
                                    <el-icon><zoom-in /></el-icon>
                                </span>
                                <span v-if="!disabled" class="el-upload-list__item-delete" @click="handleDownload(file)">
                                    <el-icon>
                                        <Download />
                                    </el-icon>
                                </span>
                                <span v-if="!disabled" class="el-upload-list__item-delete" @click="handleRemove(file)">
                                    <el-icon>
                                        <Delete />
                                    </el-icon>
                                </span>
                            </span>
                        </div>
                    </template>
                </el-upload>

                <el-dialog v-model="dialogVisible">
                    <img w-full :src="dialogImageUrl" alt="Preview Image" />
                </el-dialog>
            </el-form-item>
            <el-form-item>
                <el-button color="#577064" type="primary" @click="onSubmit">修改</el-button>
                <el-button color="#577064" onclick="location.href='/BuMenu'">返回</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script lang="ts" setup>

import { Delete, Download, Plus, ZoomIn } from '@element-plus/icons-vue';
import axios from 'axios';
import Swal from 'sweetalert2';
import { onMounted, reactive, ref } from 'vue';
import { useRoute } from 'vue-router';

import type { UploadFile } from 'element-plus';
const route = useRoute();
const dialogImageUrl = ref('')
const dialogVisible = ref(false)
const disabled = ref(false)
const handleRemove = (file: UploadFile) => {
    console.log(file)
}

const handlePictureCardPreview = (file: UploadFile) => {
    dialogImageUrl.value = file.url!
    dialogVisible.value = true
}

const handleDownload = (file: UploadFile) => {
    console.log(file)
}
// do not use same name with ref
const form = reactive({
    name: '',
    engName: '',
    price: 100,
    fkCategoryId: 2,
    status: 2,
    description: 'tasty',
});
const images = ref({});
const files = reactive({});
const fileList = ref([]);
const imageList = ref([]);

const fetchData = async () => {
    try {
        // Replace {buId} with the actual ID or variable representing the ID
        const buId = 2;
        const id = route.params.id;
        console.log(id);
        // const productId = 43; // Change this to the actual ID or pass it as a prop
        const response = await axios.get(`${import.meta.env.VITE_API_BASE}/product/fetch/` + buId + `/${id}`);
        const productData = response.data;

        // Log the fetched data to the console
        console.log('Fetched product data:', productData);

        // Populate the form model with the fetched data
        form.name = productData.name;
        form.engName = productData.engName;
        form.price = productData.price;
        form.fkCategoryId = productData.fkCategoryId;
        form.status = productData.status;
        form.description = productData.description;

        // You might need to populate image and file data here if applicable

    } catch (error) {
        console.error('Error fetching product data:', error.message);
    }
};

// Fetch data when the component is mounted
onMounted(() => {
    fetchData();
});


const beforeUploadPicture = (file) => {
    const isImage =
        file.type == 'image/png' ||
        file.type == 'image/jpg' ||
        file.type == 'image/jpeg' ||
        file.type == 'image/bmp' ||
        file.type == 'image/gif' ||
        file.type == 'image/webp';
    const isLt2M = file.size < 1024 * 1024 * 2;
    if (!isImage) {

        console.error('上傳只能是png,jpg,jpeg,bmp,gif,webp格式!');
    }
    if (!isLt2M) {
        console.error('上傳圖片大小不能超過 2MB!');
    }
    return isImage && isLt2M;
};

const handleRemovePicture = (file, fileList) => {
    console.log(file, fileList);
};

const imageChange = (file, fileList, name) => {
    console.log(file, fileList);
    imageList.value = fileList;
    images[''] = fileList;
};

const onSubmit = async () => {
    let Form: any = new FormData();
    Form.append('name', form.name);
    Form.append('engName', form.engName);
    Form.append('price', form.price);
    Form.append('fkCategoryId', form.fkCategoryId);
    Form.append('status', form.status);
    Form.append('description', form.description);

    for (const key in images) {
        if (Object.prototype.hasOwnProperty.call(images, key)) {
            const fileArray = images[key];

            for (const fileKey in fileArray) {
                if (Object.prototype.hasOwnProperty.call(fileArray, fileKey)) {
                    const item = fileArray[fileKey];
                    Form.append('image', item.raw);
                    Form.append(item.name, key);
                }
            }
        }
    }

    for (const key in files) {
        if (Object.prototype.hasOwnProperty.call(files, key)) {
            const fileArray = files[key];

            for (const fileKey in fileArray) {
                if (Object.prototype.hasOwnProperty.call(fileArray, fileKey)) {
                    const item = fileArray[fileKey];
                    Form.append('image', item.raw);
                    Form.append(item.name, key);
                }
            }
        }
    }

    try {
        const buId = 2;
        // const productId = 43;
        const id = route.params.id;
        const response = await axios.put(`${import.meta.env.VITE_API_BASE}/product/update/` + buId + `/` + `${id}`, Form);
        console.log('Server Response:', response.data);

        if (response.data) {
            // 在這裡處理後端的回應，例如提示用戶操作成功
            await Swal.fire({
                icon: 'success',
                text: '修改成功',
                confirmButtonText: '確定',
            });
            // 導回BuMenu頁面
            location.href = '/BuMenu'
        } else {
            Swal.fire({
                icon: "error",
                text: "修改失敗",
                confirmButtonText: "確定"
            });
        }
    } catch (error) {
        // 在這裡處理請求錯誤，例如提示用戶操作失敗
        Swal.fire({
            icon: "error",
            text: '發生錯誤: ' + error.message,
            confirmButtonText: "確定"
        });
    }
}


const num = ref(0)
const handleChange = (value: number) => {
    console.log(value)
}

</script>

<style scoped>
.card {
    border-color: #577064;
    border-width: 5px;
}

.form {
    margin: 10px;
}

h2 {
    color: #577064;
    font-weight: bold;
}
</style>

