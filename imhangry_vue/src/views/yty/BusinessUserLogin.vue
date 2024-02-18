<template>
    <div>
        <el-card class="box-card">
            <h2>登入</h2>
            <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-position="left" label-width="70px"
                class="login-from">
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
                            sessionStorage.setItem("userInfo",JSON.stringify(response.data.data))
                            console.log(sessionStorage.getItem('userInfo'))
                            _this.$router.push({ name: "Home" });
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
  
<style scoped>
.box-card {
    margin: auto auto;
    width: 400px;
}

.login-from {
    margin: auto auto;
}
</style>