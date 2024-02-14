
<template>
    <div class="container">
        <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="card h-100 border-0">
                    <div class=" card-body">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <!-- 照片修改-->
                                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        <img v-if="memberPic" :src="'data:image/jpeg;base64,' + memberPic"
                                            style="width: 200px; height: 200px; ">
                                        <img v-if="!memberPic" src="/members/健身鯊BEE.jpg"
                                            style="width: 200px; height: 200px; "></button>
                                    <p class="text-muted mt-2" style=" margin-left: 50px;">點擊照片進行修改</p>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog ">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">大頭貼修改</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <UpdateHeadShot :memberPic="memberPic" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12 ">
                <div class="card h-100 border-0">
                    <div class="card-body">
                        <div class="row gutters ">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                <h3 class="mb-2 ">個人資訊修改</h3>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="name">姓名</label>
                                    <input type="text" class="form-control" id="name" v-model="memberName" required>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="eMail">帳號</label>
                                    <input type="email" class="form-control" id="eMail" :placeholder="memberAccount"
                                        readonly>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="nickName">暱稱</label>
                                    <input type="text" class="form-control" id="nickName" v-model="memberNickName">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="region">地區</label>
                                    <input type="url" class="form-control" id="region" v-model="memberRegion">
                                </div>
                            </div>
                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mt-3 mb-2 ">About me</h6>
                            </div>
                            <div class="mb-3">
                                <textarea class="form-control " id="exampleFormControlTextarea1" rows="3"
                                    v-model="memberRemarks"></textarea>
                            </div>
                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-right">
                                    <RouterLink :to="{ path: `/member/home/${memberId}` }" tag="button"
                                        class="btn btn-secondary">Cancel</RouterLink>
                                    <button type="button" id="submit" name="submit" class="btn btn-primary"
                                        @click="handleUpdate">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import UpdateHeadShot from '../../components/Member/UpdateHeadShot.vue';
import { ref, onMounted } from 'vue'
import axios from 'axios';
import { getCookieData } from '../../util/Getter.js'
import Swal from 'sweetalert2';
import router from '@/router.js'
const isLoading = ref(true);
const userData = getCookieData('userData');
const memberId = userData?.memberId;
const memberPic = ref('')
const memberName = ref('')
const memberNickName = ref('')
const memberRegion = ref('')
const memberRemarks = ref('')
const memberAccount = ref('')

onMounted(async () => {
    if (!memberId) {
        console.log("no memberId");
        router.replace('/member/login');
        return;
    }
    const path = import.meta.env.VITE_API_MEMBERSURL;
    const API_URL = `${path}/home/${memberId}`;

    try {
        Swal.fire({
            title: "Loading...",
            showConfirmButton: false,
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            }
        })
        const response = await axios.get(API_URL);
        memberPic.value = response.data.memberPic;
        memberName.value = response.data.memberName;
        memberAccount.value = response.data.memberAccount;
        memberNickName.value = response.data.memberNickName;
        memberRemarks.value = response.data.memberRemarks;
        memberRegion.value = response.data.memberRegion;
        console.log("old response.data=", response.data);
    } catch (error) {
        console.error("沒有讀到會員資訊:", error);
    } finally {
        setTimeout(() => {
            Swal.close();
            isLoading.value = false;
        }, 100);
    }

});
const handleUpdate = async (event) => {
    event.preventDefault();
    const updateData = {
        memberName: memberName.value,
        memberNickName: memberNickName.value,
        memberRegion: memberRegion.value,
        memberRemarks: memberRemarks.value
    }
    console.log(updateData)
    const path = import.meta.env.VITE_API_MEMBERSURL;
    const API_URL = `${path}/updateInfo/${memberId}`;
    try {
        const response = await axios.put(API_URL, updateData);
        const success = response.data.success;
        const message = response.data.message;
        if (success) {
            Swal.fire({
                title: '修改成功!',
                text: '跳轉回個人主頁',
                icon: 'success',
                showConfirmButton: false,
                allowOutsideClick: false,
                timer: 1500,
            }).then(() => {
                router.push(`/member/home/${memberId}`);
            })
        } else {
            Swal.fire({
                title: '修改失敗',
                text: message,
                icon: 'error',
                allowOutsideClick: false,
            });
        }
    } catch (error) {
        console.log("error", error);
    }
};
</script>

<style scoped>
textarea {
    width: 100%;
    box-sizing: border-box;
    padding: 10px;
    resize: none;
}

.btn img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    /* 使圖片成為圓形 */
    object-fit: cover;
    /* 確保圖片填滿整個圓形區域 */
}

h3 {
    margin-bottom: 20px;
}

/* #exampleModal {
    width: 250px;

} */

.modal-dialog {
    width: 100%;
    max-width: 400px;
    /* 設定最大寬度 */
}
</style>