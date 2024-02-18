<template>
    <el-tabs type="border-card" class="demo-tabs">
        <el-tab-pane>
            <template #label>
                <span class="custom-tabs-label">

                    <span>顧客登入</span>
                </span>
            </template>
            <form @submit="handleSubmit">
                <div class="mb-3">
                    <label for="email" class="form-label">帳號(Email)</label>
                    <input v-model="email" type="email" class="form-control" id="email" aria-describedby="emailHelp"
                        required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">密碼</label>
                    <input v-model="password" type="password" class="form-control" id="password" required>
                </div>
                <button type="submit" class="btn btn-primary">登入</button>
            </form>
        </el-tab-pane>
        <el-tab-pane label="商家登入">
            <div>
                <el-card class="box-card">
                    <h2>登入</h2>
                    <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-position="left"
                        label-width="70px" class="login-from">
                        <el-form-item label="帳號" prop="uname">
                            <el-input v-model="ruleForm.uname"></el-input>
                        </el-form-item>
                        <el-form-item label="密碼" prop="password">
                            <el-input type="password" v-model="ruleForm.password" autocomplete="off"></el-input>
                        </el-form-item>
                    </el-form>
                    <div class="btnGroup">

                        <el-button type="primary" @click="submitForm('ruleForm')">登入</el-button>
                        <el-button @click="resetForm('ruleForm')">重置</el-button>
                        <router-link to="/Bregister">
                            <el-button style="margin-left:10px">註冊</el-button>
                        </router-link>
                    </div>
                </el-card>
            </div>
        </el-tab-pane>

    </el-tabs>
</template>
    



<script>
import axios from 'axios';

const contextPath = "${pageContext.request.contextPath}"
export default {
    data() {
        return {
            ruleForm: {
                uname: "",
                password: "",
            },
            rules: {
                uname: [
                    { required: true, message: "請輸入帳號!", trigger: "blur" },
                ],
                password: [
                    { required: true, message: "請輸入密碼!", trigger: "blur" },
                ],
            },
            loading: false,
        };
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
                this.loading = true;

                if (valid) {
                    let _this = this;

                    // alert("submit!");

                    axios({
                        method: 'post',
                        url: `${import.meta.env.VITE_API_BASE}/user/login`,
                        headers: { "Content-Type": "application/json", },
                        params: {
                            name: _this.ruleForm.uname,
                            password: _this.ruleForm.password,
                        },
                    }).then(function (response) {
                        console.log("response", response)
                        if (response.data.code == 0) {
                            console.log("success")
                            sessionStorage.setItem("userInfo", JSON.stringify(response.data.data))
                            console.log(sessionStorage.getItem('userInfo'))
                            //登入成功後回到首頁重整渲染NavBar
                            _this.$router.push({ name: "Home" }).then(() => {
                                window.location.reload();
                            });
                            _this.$message({
                                message: response.data.msg,
                                type: "success",
                            });
                        } else {
                            _this.$message({
                                message: response.data.msg,
                                type: "warning",
                            });
                        }
                    }).catch()

                } else {
                    console.log("error submit!!");
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        },
    },
};
</script>



    
<style>
.demo-tabs>.el-tabs__content {
    padding: 32px;
    color: #6b778c;
    font-size: 32px;
    font-weight: 600;
}

.demo-tabs .custom-tabs-label .el-icon {
    vertical-align: middle;
}

.demo-tabs .custom-tabs-label span {
    vertical-align: middle;
    margin-left: 4px;
}



.box-card {
    margin: auto auto;
    width: 400px;
}

.login-from {
    margin: auto auto;
}
</style>
<script setup >
import { ref, onMounted } from 'vue';
import axios from 'axios';
import router from '@/router/router';
import Swal from 'sweetalert2';
import { getCookieData } from "@/components/sean/util/Gettes"
onMounted(() => {
    const userData = getCookieData("userData");
    if (userData && userData.id) {
        router.push({ name: "LoginHome", params: { id: userData.id } });
    }
})
//使用者輸入的資訊
const email = ref('');
const password = ref('');

const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms));

//按下登入觸發的函式
const handleSubmit = async function (event) {
    event.preventDefault();

    const input = {
        email: email.value,
        password: password.value,
    };

    const path = import.meta.env.VITE_API_GUESTUSERURL;
    const API_URL = `${path}/login`;
    console.log("登入",API_URL);
    try {
        const response = await axios.post(API_URL, input, { withCredentials: true });
        // const response = await axios.post(API_URL, input);

        const success = response.data.success;
        const message = response.data.message;
        console.log(response.data);

        if (success) {
            await sleep(500);
            const userData = getCookieData("userData");
            console.log(userData);
            const id = userData.id;
            console.log('id:', id);

            Swal.fire({
                title: '登入成功',
                text: '返回首頁',
                icon: 'success',
                showConfirmButton: false,
                allowOutsideClick: false,
                timer: 1500,
                didClose: () => {
                    router.go({ name: "LoginHome", params: { id: userData.id } });
                }
            });

        } else {
            Swal.fire({
                title: '登入失敗',
                text: message,
                icon: 'error',
                allowOutsideClick: false,
            });
        }
    } catch (error) {
        console.log("error", error);
    }
}
</script>