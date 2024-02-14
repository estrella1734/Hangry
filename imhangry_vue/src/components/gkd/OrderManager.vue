<template>

    
    <div class="orderManagerContainer">

        <div>
            <h3>訂單管理系統</h3>
        </div>

        <div class="accordion-wrap">
            <a class="accordion" data-bs-toggle="collapse" :data-bs-target="'#collapse' + item.id" role="button"
                aria-expanded="false" v-for="item in Object.values(order)" :key="item.id">

                <!-- 顯示內容 -->
                <div class="teaser">

                    <div class="time">
                        <h5>訂單#{{ item.id }}</h5>
                    </div>

                    <div class="title">
                        <h5>地址：{{ item.address }}</h5>
                        <h6 class="theme">付款方式：{{ item.paymentType }}</h6>
                        <h6 class="theme">總額：{{item.total}}</h6>
                    </div>


                </div>
                <!-- 顯示內容 -->

                <!-- 折疊的內容 -->
                <div class="collapse" :id="'collapse' + item.id">
                    <div class="content">
                        <table class="productContent">

                            <thead>
                                <tr>
                                    <th>品名</th>
                                    <th>商品ID</th>
                                    <th>數量</th>
                                    <th>價格</th>
                                </tr>
                            </thead>

                            <tbody v-for="productList in item.products">
                                <tr>
                                    <td style="width: 10%; height:40px;">{{ productList.name }}</td>
                                    <td style="width: 10%;">{{ productList.fkProductId }}</td>
                                    <td style="width: 10%;">{{ productList.amount }}</td>
                                    <td style="width: 10%;">{{ productList.price }}</td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                </div>

                <!-- 展開與收起 -->
                <div class="accordion-toggle" style="background-color: #33808B;">
                    <span class="one"></span>
                    <span class="two"></span>
                </div>
                <!-- 展開與收起 -->


                <!-- 折疊的內容 -->
            </a>
        </div>
    </div>
</template>


<script setup>
import axios from 'axios';
import { onMounted, reactive } from 'vue';
const order = reactive({});

//拿出使用者資料
const userString = sessionStorage.getItem('userInfo');
const user = JSON.parse(userString);
const buId = user.id;

const fetchData = async () => {
    const response = await axios.get('http://localhost:8080/pages/rest/orderform/orderManager/' + buId);


    var data = response.data;

    //轉換支付方式從英文到中文
    var convertMap = {
        'cash':'現金',
        'ec pay':'綠界支付',
        'cash on delivery':'貨到付款',
        'credit card':'信用卡',
    }

    data.forEach(function(item){
        if(item.paymentType in convertMap){
            item.paymentType = convertMap[item.paymentType];
        }
        item.total = item.products.reduce((acc,item)=>{
            return acc + (item.amount * item.price)
        },0)
    })
    console.log(data);



    Object.assign(order, response.data);
}

onMounted(fetchData);

</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

* {
    font-family: 'Montserrat', sans-serif;
}

h3 {
    font-size: 34px;
    color: #fff;
}

h5 {
    font-size: 20px;
}

h6 {
    font-size: 16px;
}

.orderManagerContainer {
    margin-top: 5%;
    padding: 30px;
    border-radius: 1rem;


    /* 半透明白色背景 */
    background: rgba(255, 255, 255, 0.1);
    /* 模糊效果 */
    backdrop-filter: blur(30px);
    /* 邊框和其他裝飾性樣式 */
    border: 1px solid rgba(255, 255, 255, 0.3);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding-top: 0.8%;
}

.accordion-wrap {
    width: 100%;
    display: flex;
    flex-direction: column;

    a {
        color: #fff;
        text-decoration: none;

        &:hover {
            text-decoration: none;
        }
    }

    .accordion {
        position: relative;
        border-top: 1px solid #fff;

        &:last-child {
            border-bottom: 1px solid #fff;
        }

        .teaser {
            display: flex;
            align-items: flex-start;
            justify-content: flex-start;
            width: 100%;
            padding: 24px 100px 24px 0;
            /* margin-top: 10px;
            margin-bottom: 10px; */
            position: relative;

            &:last-child {
                border-bottom: 1px solid #fff;
            }

            .time {
                margin-top: 5px;
                width: 200px;
                /* background-color: aqua; */
            }

            .title {
                .theme {
                    opacity: 0.4;
                }
            }

            @media (max-width: 990px) {
                flex-direction: column;
            }
        }

        .content {
            padding: 0 120px 30px 200px;

            @media (max-width: 1200px) {
                padding: 0 120px 30px 0;
            }
        }

        .accordion-toggle {

            width: 100px;
            height: 100%;
            position: absolute;
            background-color: rgba(255, 255, 255, 0.14);
            right: 0;
            top: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: 0.3s ease;


            span {
                background-color: #fff;
                transition: 0.3s ease;

                &.one {
                    height: 1px;
                    width: 26px;
                    position: absolute;
                    top: 50%;
                }

                &.two {
                    width: 1px;
                    height: 26px;
                    position: absolute;
                    left: 50%;
                    opacity: 0;
                    transform: rotate(120deg);
                }
            }
        }

        &.collapsed {
            .accordion-toggle {
                span.two {
                    opacity: 1;
                    transform: rotate(0);
                }
            }
        }
    }
}
</style>