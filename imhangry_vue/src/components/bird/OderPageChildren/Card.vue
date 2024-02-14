<template>
	<el-card class="box-card" shadow="never">

		<div class="title" >{{ businessUser.name }}
            <LikeComponent style="position: absolute;" :fk_business_id="businessUser.id"></LikeComponent>
		</div>
        
		<a href="javascript:" class="a">{{ businessUser.brandName }}</a>
		<div class="rate">
			<el-rate v-model="value" disabled show-score text-color="#616161" score-template="{value}" />
			<!-- <span class="count">({{ businessUser.rateCount }})</span> -->
		</div>
		<div class="desc">
			<el-icon :size="20">
				<Clock />
			</el-icon>
			<div class="text item">{{ businessUser.time }}</div>
		</div>
		<div class="desc">
			<el-icon :size="20">
				<Phone />
			</el-icon>
			<div class="text item pointer">{{ businessUser.phone }}</div>
		</div>
		<div class="desc">
			<el-icon :size="20">
				<Location />
			</el-icon>
			<div class="text item pointer">{{ businessUser.city + businessUser.dist + businessUser.address }}</div>
		</div>

	</el-card>
</template>
<script lang="ts" setup>
import { ref, onMounted } from 'vue'
import { useOrderPageStore } from '@/stores/orderPage';
import LikeComponent from '@/components/leon/LikeComponent.vue';
import { useRoute } from 'vue-router';
const {params:{id}} = useRoute();


const { businessUser, getBusinessUser } = useOrderPageStore();
const value = ref(businessUser.rate)


onMounted(() => {
	
    if(id){
	getBusinessUser(+id)}
	else{
		 getBusinessUser();
	}
}
)
</script>
	
<style scoped>
.pointer {
	cursor: pointer;
}

.text.item {
	padding-left: 10px;
	padding-top: 3px;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
}

.desc {
	display: flex;
	justify-content: left;
	padding-top: 5px;
}

.rate .count {
	padding-left: 10px;
	color: #616161;
}

.rate {
	display: flex;
	align-items: center;
}

.a {
	text-decoration: none;
	color: #616161;
	font-weight: 600;
}

.title {
	font-size: 30px;
	font-weight: 600;
}

.text {
	font-size: 14px;
}

.item {
	margin-bottom: 18px;
}

.box-card {
	width: 375px;
	border: 0px;

}</style>
