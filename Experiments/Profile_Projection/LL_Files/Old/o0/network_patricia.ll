; ModuleID = 'network_patricia.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ptree = type { i64, ptr, i8, i8, ptr, ptr }
%struct.ptree_mask = type { i64, ptr }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Usage: %s <TCP stream>\0A\00", align 1
@.str.1.5 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2.6 = private unnamed_addr constant [31 x i8] c"File %s doesn't seem to exist\0A\00", align 1
@.str.3.7 = private unnamed_addr constant [23 x i8] c"Allocating p-trie node\00", align 1
@.str.4.8 = private unnamed_addr constant [28 x i8] c"Allocating p-trie mask data\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"Allocating p-trie mask's node data\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%f %d\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%f %08x: \00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Found.\0A\00", align 1
@stderr = external global ptr, align 8
@.str.9 = private unnamed_addr constant [22 x i8] c"Failed on pat_insert\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg2) #0 {
bb:
  %i = alloca i64, align 8
  %i3 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  %i4 = icmp eq ptr %i3, null
  br i1 %i4, label %bb5, label %bb8

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @stderr, align 8
  %i7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i6, ptr noundef @.str.2)
  br label %bb23

bb8:                                              ; preds = %bb
  %i9 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i3, ptr noundef @.str.3, ptr noundef %i)
  %i10 = call i32 @fclose(ptr noundef %i3)
  br label %bb11

bb11:                                             ; preds = %bb20, %bb8
  %.01 = phi i64 [ 0, %bb8 ], [ %i21, %bb20 ]
  %i12 = load i64, ptr %i, align 8
  %i13 = icmp slt i64 %.01, %i12
  br i1 %i13, label %bb14, label %bb22

bb14:                                             ; preds = %bb11
  %i15 = add nsw i64 %.01, 1
  %i16 = load i64, ptr %i, align 8
  %i17 = icmp eq i64 %i15, %i16
  %i18 = zext i1 %i17 to i32
  %i19 = call i32 @main1(i32 noundef %arg, ptr noundef %arg2, i32 noundef %i18)
  br label %bb20

bb20:                                             ; preds = %bb14
  %i21 = add nsw i64 %.01, 1
  br label %bb11, !llvm.loop !8

bb22:                                             ; preds = %bb11
  br label %bb23

bb23:                                             ; preds = %bb22, %bb5
  %.0 = phi i32 [ 1, %bb5 ], [ 0, %bb22 ]
  ret i32 %.0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @pat_insert(ptr noundef %arg, ptr noundef %arg6) #0 {
bb:
  %i = icmp ne ptr %arg6, null
  br i1 %i, label %bb7, label %bb.bb13_crit_edge

bb.bb13_crit_edge:                                ; preds = %bb
  br label %bb13

bb7:                                              ; preds = %bb
  %i8 = icmp ne ptr %arg, null
  br i1 %i8, label %bb9, label %bb7.bb13_crit_edge

bb7.bb13_crit_edge:                               ; preds = %bb7
  br label %bb13

bb9:                                              ; preds = %bb7
  %i10 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i11 = load ptr, ptr %i10, align 8
  %i12 = icmp ne ptr %i11, null
  br i1 %i12, label %bb14, label %bb9.bb13_crit_edge

bb9.bb13_crit_edge:                               ; preds = %bb9
  br label %bb13

bb13:                                             ; preds = %bb9.bb13_crit_edge, %bb7.bb13_crit_edge, %bb.bb13_crit_edge
  br label %bb174

bb14:                                             ; preds = %bb9
  %i15 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i16 = load ptr, ptr %i15, align 8
  %i17 = getelementptr inbounds %struct.ptree_mask, ptr %i16, i32 0, i32 0
  %i18 = load i64, ptr %i17, align 8
  %i19 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 0
  %i20 = load i64, ptr %i19, align 8
  %i21 = and i64 %i20, %i18
  store i64 %i21, ptr %i19, align 8
  br label %bb22

bb22:                                             ; preds = %bb41.bb22_crit_edge, %bb14
  %.02 = phi ptr [ %arg6, %bb14 ], [ %i40, %bb41.bb22_crit_edge ]
  %i23 = getelementptr inbounds %struct.ptree, ptr %.02, i32 0, i32 3
  %i24 = load i8, ptr %i23, align 1
  %i25 = sext i8 %i24 to i32
  %i26 = getelementptr inbounds %struct.ptree, ptr %.02, i32 0, i32 3
  %i27 = load i8, ptr %i26, align 1
  %i28 = sext i8 %i27 to i32
  %i29 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 0
  %i30 = load i64, ptr %i29, align 8
  %i31 = call i64 @bit(i32 noundef %i28, i64 noundef %i30)
  %i32 = icmp ne i64 %i31, 0
  br i1 %i32, label %bb33, label %bb36

bb33:                                             ; preds = %bb22
  %i34 = getelementptr inbounds %struct.ptree, ptr %.02, i32 0, i32 5
  %i35 = load ptr, ptr %i34, align 8
  br label %bb39

bb36:                                             ; preds = %bb22
  %i37 = getelementptr inbounds %struct.ptree, ptr %.02, i32 0, i32 4
  %i38 = load ptr, ptr %i37, align 8
  br label %bb39

bb39:                                             ; preds = %bb36, %bb33
  %i40 = phi ptr [ %i35, %bb33 ], [ %i38, %bb36 ]
  br label %bb41

bb41:                                             ; preds = %bb39
  %i42 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 3
  %i43 = load i8, ptr %i42, align 1
  %i44 = sext i8 %i43 to i32
  %i45 = icmp slt i32 %i25, %i44
  br i1 %i45, label %bb41.bb22_crit_edge, label %bb46, !llvm.loop !10

bb41.bb22_crit_edge:                              ; preds = %bb41
  br label %bb22

bb46:                                             ; preds = %bb41
  %i47 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 0
  %i48 = load i64, ptr %i47, align 8
  %i49 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 0
  %i50 = load i64, ptr %i49, align 8
  %i51 = icmp eq i64 %i48, %i50
  br i1 %i51, label %bb52, label %bb139

bb52:                                             ; preds = %bb46
  br label %bb53

bb53:                                             ; preds = %bb83, %bb52
  %.03 = phi i32 [ 0, %bb52 ], [ %i84, %bb83 ]
  %i54 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 2
  %i55 = load i8, ptr %i54, align 8
  %i56 = zext i8 %i55 to i32
  %i57 = icmp slt i32 %.03, %i56
  br i1 %i57, label %bb58, label %bb85

bb58:                                             ; preds = %bb53
  %i59 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i60 = load ptr, ptr %i59, align 8
  %i61 = getelementptr inbounds %struct.ptree_mask, ptr %i60, i32 0, i32 0
  %i62 = load i64, ptr %i61, align 8
  %i63 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 1
  %i64 = load ptr, ptr %i63, align 8
  %i65 = sext i32 %.03 to i64
  %i66 = getelementptr inbounds %struct.ptree_mask, ptr %i64, i64 %i65
  %i67 = getelementptr inbounds %struct.ptree_mask, ptr %i66, i32 0, i32 0
  %i68 = load i64, ptr %i67, align 8
  %i69 = icmp eq i64 %i62, %i68
  br i1 %i69, label %bb70, label %bb82

bb70:                                             ; preds = %bb58
  %i71 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i72 = load ptr, ptr %i71, align 8
  %i73 = getelementptr inbounds %struct.ptree_mask, ptr %i72, i32 0, i32 1
  %i74 = load ptr, ptr %i73, align 8
  %i75 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 1
  %i76 = load ptr, ptr %i75, align 8
  %i77 = sext i32 %.03 to i64
  %i78 = getelementptr inbounds %struct.ptree_mask, ptr %i76, i64 %i77
  %i79 = getelementptr inbounds %struct.ptree_mask, ptr %i78, i32 0, i32 1
  store ptr %i74, ptr %i79, align 8
  %i80 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i81 = load ptr, ptr %i80, align 8
  call void @free(ptr noundef %i81) #7
  call void @free(ptr noundef %arg) #7
  br label %bb174

bb82:                                             ; preds = %bb58
  br label %bb83

bb83:                                             ; preds = %bb82
  %i84 = add nsw i32 %.03, 1
  br label %bb53, !llvm.loop !11

bb85:                                             ; preds = %bb53
  %i86 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 2
  %i87 = load i8, ptr %i86, align 8
  %i88 = zext i8 %i87 to i32
  %i89 = add nsw i32 %i88, 1
  %i90 = sext i32 %i89 to i64
  %i91 = mul i64 16, %i90
  %i92 = call noalias ptr @malloc(i64 noundef %i91) #8
  br label %bb93

bb93:                                             ; preds = %bb123, %bb85
  %.05 = phi ptr [ %i92, %bb85 ], [ %i124, %bb123 ]
  %.14 = phi i32 [ 0, %bb85 ], [ %.2, %bb123 ]
  %.01 = phi i32 [ 0, %bb85 ], [ %.1, %bb123 ]
  %i94 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 2
  %i95 = load i8, ptr %i94, align 8
  %i96 = zext i8 %i95 to i32
  %i97 = icmp slt i32 %.14, %i96
  br i1 %i97, label %bb98, label %bb125

bb98:                                             ; preds = %bb93
  %i99 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i100 = load ptr, ptr %i99, align 8
  %i101 = getelementptr inbounds %struct.ptree_mask, ptr %i100, i32 0, i32 0
  %i102 = load i64, ptr %i101, align 8
  %i103 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 1
  %i104 = load ptr, ptr %i103, align 8
  %i105 = sext i32 %.14 to i64
  %i106 = getelementptr inbounds %struct.ptree_mask, ptr %i104, i64 %i105
  %i107 = getelementptr inbounds %struct.ptree_mask, ptr %i106, i32 0, i32 0
  %i108 = load i64, ptr %i107, align 8
  %i109 = icmp ugt i64 %i102, %i108
  br i1 %i109, label %bb110, label %bb116

bb110:                                            ; preds = %bb98
  %i111 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 1
  %i112 = load ptr, ptr %i111, align 8
  %i113 = sext i32 %.14 to i64
  %i114 = getelementptr inbounds %struct.ptree_mask, ptr %i112, i64 %i113
  call void @llvm.memmove.p0.p0.i64(ptr align 8 %.05, ptr align 8 %i114, i64 16, i1 false)
  %i115 = add nsw i32 %.14, 1
  br label %bb122

bb116:                                            ; preds = %bb98
  %i117 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i118 = load ptr, ptr %i117, align 8
  call void @llvm.memmove.p0.p0.i64(ptr align 8 %.05, ptr align 8 %i118, i64 16, i1 false)
  %i119 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i120 = load ptr, ptr %i119, align 8
  %i121 = getelementptr inbounds %struct.ptree_mask, ptr %i120, i32 0, i32 0
  store i64 4294967295, ptr %i121, align 8
  br label %bb122

bb122:                                            ; preds = %bb116, %bb110
  %.2 = phi i32 [ %i115, %bb110 ], [ %.14, %bb116 ]
  %.1 = phi i32 [ %.01, %bb110 ], [ 1, %bb116 ]
  br label %bb123

bb123:                                            ; preds = %bb122
  %i124 = getelementptr inbounds %struct.ptree_mask, ptr %.05, i32 1
  br label %bb93, !llvm.loop !12

bb125:                                            ; preds = %bb93
  %i126 = icmp ne i32 %.01, 0
  br i1 %i126, label %bb125.bb130_crit_edge, label %bb127

bb125.bb130_crit_edge:                            ; preds = %bb125
  br label %bb130

bb127:                                            ; preds = %bb125
  %i128 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i129 = load ptr, ptr %i128, align 8
  call void @llvm.memmove.p0.p0.i64(ptr align 8 %.05, ptr align 8 %i129, i64 16, i1 false)
  br label %bb130

bb130:                                            ; preds = %bb127, %bb125.bb130_crit_edge
  %i131 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i132 = load ptr, ptr %i131, align 8
  call void @free(ptr noundef %i132) #7
  call void @free(ptr noundef %arg) #7
  %i133 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 2
  %i134 = load i8, ptr %i133, align 8
  %i135 = add i8 %i134, 1
  store i8 %i135, ptr %i133, align 8
  %i136 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 1
  %i137 = load ptr, ptr %i136, align 8
  call void @free(ptr noundef %i137) #7
  %i138 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 1
  store ptr %i92, ptr %i138, align 8
  br label %bb174

bb139:                                            ; preds = %bb46
  br label %bb140

bb140:                                            ; preds = %bb153, %bb139
  %.3 = phi i32 [ 1, %bb139 ], [ %i154, %bb153 ]
  %i141 = icmp slt i32 %.3, 32
  br i1 %i141, label %bb142, label %bb140.bb150_crit_edge

bb140.bb150_crit_edge:                            ; preds = %bb140
  br label %bb150

bb142:                                            ; preds = %bb140
  %i143 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 0
  %i144 = load i64, ptr %i143, align 8
  %i145 = call i64 @bit(i32 noundef %.3, i64 noundef %i144)
  %i146 = getelementptr inbounds %struct.ptree, ptr %i40, i32 0, i32 0
  %i147 = load i64, ptr %i146, align 8
  %i148 = call i64 @bit(i32 noundef %.3, i64 noundef %i147)
  %i149 = icmp eq i64 %i145, %i148
  br label %bb150

bb150:                                            ; preds = %bb142, %bb140.bb150_crit_edge
  %i151 = phi i1 [ false, %bb140.bb150_crit_edge ], [ %i149, %bb142 ]
  br i1 %i151, label %bb152, label %bb155

bb152:                                            ; preds = %bb150
  br label %bb153

bb153:                                            ; preds = %bb152
  %i154 = add nsw i32 %.3, 1
  br label %bb140, !llvm.loop !13

bb155:                                            ; preds = %bb150
  %i156 = getelementptr inbounds %struct.ptree, ptr %arg6, i32 0, i32 3
  %i157 = load i8, ptr %i156, align 1
  %i158 = sext i8 %i157 to i32
  %i159 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 0
  %i160 = load i64, ptr %i159, align 8
  %i161 = call i64 @bit(i32 noundef %i158, i64 noundef %i160)
  %i162 = icmp ne i64 %i161, 0
  br i1 %i162, label %bb163, label %bb168

bb163:                                            ; preds = %bb155
  %i164 = getelementptr inbounds %struct.ptree, ptr %arg6, i32 0, i32 5
  %i165 = load ptr, ptr %i164, align 8
  %i166 = call ptr @insertR(ptr noundef %i165, ptr noundef %arg, i32 noundef %.3, ptr noundef %arg6)
  %i167 = getelementptr inbounds %struct.ptree, ptr %arg6, i32 0, i32 5
  store ptr %i166, ptr %i167, align 8
  br label %bb173

bb168:                                            ; preds = %bb155
  %i169 = getelementptr inbounds %struct.ptree, ptr %arg6, i32 0, i32 4
  %i170 = load ptr, ptr %i169, align 8
  %i171 = call ptr @insertR(ptr noundef %i170, ptr noundef %arg, i32 noundef %.3, ptr noundef %arg6)
  %i172 = getelementptr inbounds %struct.ptree, ptr %arg6, i32 0, i32 4
  store ptr %i171, ptr %i172, align 8
  br label %bb173

bb173:                                            ; preds = %bb168, %bb163
  br label %bb174

bb174:                                            ; preds = %bb173, %bb130, %bb70, %bb13
  %.0 = phi ptr [ %i40, %bb70 ], [ %i40, %bb130 ], [ %arg, %bb173 ], [ null, %bb13 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i64 @bit(i32 noundef %arg, i64 noundef %arg1) #0 {
bb:
  %i = sub nsw i32 31, %arg
  %i2 = shl i32 1, %i
  %i3 = sext i32 %i2 to i64
  %i4 = and i64 %arg1, %i3
  ret i64 %i4
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define internal ptr @insertR(ptr noundef %arg, ptr noundef %arg1, i32 noundef %arg2, ptr noundef %arg3) #0 {
bb:
  %i = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 3
  %i4 = load i8, ptr %i, align 1
  %i5 = sext i8 %i4 to i32
  %i6 = icmp sge i32 %i5, %arg2
  br i1 %i6, label %bb.bb15_crit_edge, label %bb7

bb.bb15_crit_edge:                                ; preds = %bb
  br label %bb15

bb7:                                              ; preds = %bb
  %i8 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 3
  %i9 = load i8, ptr %i8, align 1
  %i10 = sext i8 %i9 to i32
  %i11 = getelementptr inbounds %struct.ptree, ptr %arg3, i32 0, i32 3
  %i12 = load i8, ptr %i11, align 1
  %i13 = sext i8 %i12 to i32
  %i14 = icmp sle i32 %i10, %i13
  br i1 %i14, label %bb7.bb15_crit_edge, label %bb36

bb7.bb15_crit_edge:                               ; preds = %bb7
  br label %bb15

bb15:                                             ; preds = %bb7.bb15_crit_edge, %bb.bb15_crit_edge
  %i16 = trunc i32 %arg2 to i8
  %i17 = getelementptr inbounds %struct.ptree, ptr %arg1, i32 0, i32 3
  store i8 %i16, ptr %i17, align 1
  %i18 = getelementptr inbounds %struct.ptree, ptr %arg1, i32 0, i32 0
  %i19 = load i64, ptr %i18, align 8
  %i20 = call i64 @bit(i32 noundef %arg2, i64 noundef %i19)
  %i21 = icmp ne i64 %i20, 0
  br i1 %i21, label %bb22, label %bb23

bb22:                                             ; preds = %bb15
  br label %bb24

bb23:                                             ; preds = %bb15
  br label %bb24

bb24:                                             ; preds = %bb23, %bb22
  %i25 = phi ptr [ %arg, %bb22 ], [ %arg1, %bb23 ]
  %i26 = getelementptr inbounds %struct.ptree, ptr %arg1, i32 0, i32 4
  store ptr %i25, ptr %i26, align 8
  %i27 = getelementptr inbounds %struct.ptree, ptr %arg1, i32 0, i32 0
  %i28 = load i64, ptr %i27, align 8
  %i29 = call i64 @bit(i32 noundef %arg2, i64 noundef %i28)
  %i30 = icmp ne i64 %i29, 0
  br i1 %i30, label %bb31, label %bb32

bb31:                                             ; preds = %bb24
  br label %bb33

bb32:                                             ; preds = %bb24
  br label %bb33

bb33:                                             ; preds = %bb32, %bb31
  %i34 = phi ptr [ %arg1, %bb31 ], [ %arg, %bb32 ]
  %i35 = getelementptr inbounds %struct.ptree, ptr %arg1, i32 0, i32 5
  store ptr %i34, ptr %i35, align 8
  br label %bb55

bb36:                                             ; preds = %bb7
  %i37 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 3
  %i38 = load i8, ptr %i37, align 1
  %i39 = sext i8 %i38 to i32
  %i40 = getelementptr inbounds %struct.ptree, ptr %arg1, i32 0, i32 0
  %i41 = load i64, ptr %i40, align 8
  %i42 = call i64 @bit(i32 noundef %i39, i64 noundef %i41)
  %i43 = icmp ne i64 %i42, 0
  br i1 %i43, label %bb44, label %bb49

bb44:                                             ; preds = %bb36
  %i45 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 5
  %i46 = load ptr, ptr %i45, align 8
  %i47 = call ptr @insertR(ptr noundef %i46, ptr noundef %arg1, i32 noundef %arg2, ptr noundef %arg)
  %i48 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 5
  store ptr %i47, ptr %i48, align 8
  br label %bb54

bb49:                                             ; preds = %bb36
  %i50 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 4
  %i51 = load ptr, ptr %i50, align 8
  %i52 = call ptr @insertR(ptr noundef %i51, ptr noundef %arg1, i32 noundef %arg2, ptr noundef %arg)
  %i53 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 4
  store ptr %i52, ptr %i53, align 8
  br label %bb54

bb54:                                             ; preds = %bb49, %bb44
  br label %bb55

bb55:                                             ; preds = %bb54, %bb33
  %.0 = phi ptr [ %arg1, %bb33 ], [ %arg, %bb54 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @pat_remove(ptr noundef %arg, ptr noundef %arg7) #0 {
bb:
  %i = icmp ne ptr %arg, null
  br i1 %i, label %bb8, label %bb.bb14_crit_edge

bb.bb14_crit_edge:                                ; preds = %bb
  br label %bb14

bb8:                                              ; preds = %bb
  %i9 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i10 = load ptr, ptr %i9, align 8
  %i11 = icmp ne ptr %i10, null
  br i1 %i11, label %bb12, label %bb8.bb14_crit_edge

bb8.bb14_crit_edge:                               ; preds = %bb8
  br label %bb14

bb12:                                             ; preds = %bb8
  %i13 = icmp ne ptr undef, null
  br i1 %i13, label %bb15, label %bb12.bb14_crit_edge

bb12.bb14_crit_edge:                              ; preds = %bb12
  br label %bb14

bb14:                                             ; preds = %bb12.bb14_crit_edge, %bb8.bb14_crit_edge, %bb.bb14_crit_edge
  br label %bb243

bb15:                                             ; preds = %bb12
  br label %bb16

bb16:                                             ; preds = %bb35.bb16_crit_edge, %bb15
  %.06 = phi ptr [ %arg7, %bb15 ], [ %i34, %bb35.bb16_crit_edge ]
  %.04 = phi ptr [ %arg7, %bb15 ], [ %.06, %bb35.bb16_crit_edge ]
  %i17 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 3
  %i18 = load i8, ptr %i17, align 1
  %i19 = sext i8 %i18 to i32
  %i20 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 3
  %i21 = load i8, ptr %i20, align 1
  %i22 = sext i8 %i21 to i32
  %i23 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 0
  %i24 = load i64, ptr %i23, align 8
  %i25 = call i64 @bit(i32 noundef %i22, i64 noundef %i24)
  %i26 = icmp ne i64 %i25, 0
  br i1 %i26, label %bb27, label %bb30

bb27:                                             ; preds = %bb16
  %i28 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 5
  %i29 = load ptr, ptr %i28, align 8
  br label %bb33

bb30:                                             ; preds = %bb16
  %i31 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 4
  %i32 = load ptr, ptr %i31, align 8
  br label %bb33

bb33:                                             ; preds = %bb30, %bb27
  %i34 = phi ptr [ %i29, %bb27 ], [ %i32, %bb30 ]
  br label %bb35

bb35:                                             ; preds = %bb33
  %i36 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 3
  %i37 = load i8, ptr %i36, align 1
  %i38 = sext i8 %i37 to i32
  %i39 = icmp slt i32 %i19, %i38
  br i1 %i39, label %bb35.bb16_crit_edge, label %bb40, !llvm.loop !14

bb35.bb16_crit_edge:                              ; preds = %bb35
  br label %bb16

bb40:                                             ; preds = %bb35
  %i41 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 0
  %i42 = load i64, ptr %i41, align 8
  %i43 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 0
  %i44 = load i64, ptr %i43, align 8
  %i45 = icmp ne i64 %i42, %i44
  br i1 %i45, label %bb46, label %bb47

bb46:                                             ; preds = %bb40
  br label %bb243

bb47:                                             ; preds = %bb40
  %i48 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 2
  %i49 = load i8, ptr %i48, align 8
  %i50 = zext i8 %i49 to i32
  %i51 = icmp eq i32 %i50, 1
  br i1 %i51, label %bb52, label %bb174

bb52:                                             ; preds = %bb47
  %i53 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 3
  %i54 = load i8, ptr %i53, align 1
  %i55 = sext i8 %i54 to i32
  %i56 = icmp eq i32 %i55, 0
  br i1 %i56, label %bb57, label %bb58

bb57:                                             ; preds = %bb52
  br label %bb243

bb58:                                             ; preds = %bb52
  %i59 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 1
  %i60 = load ptr, ptr %i59, align 8
  %i61 = getelementptr inbounds %struct.ptree_mask, ptr %i60, i32 0, i32 0
  %i62 = load i64, ptr %i61, align 8
  %i63 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i64 = load ptr, ptr %i63, align 8
  %i65 = getelementptr inbounds %struct.ptree_mask, ptr %i64, i32 0, i32 0
  %i66 = load i64, ptr %i65, align 8
  %i67 = icmp ne i64 %i62, %i66
  br i1 %i67, label %bb68, label %bb69

bb68:                                             ; preds = %bb58
  br label %bb243

bb69:                                             ; preds = %bb58
  br label %bb70

bb70:                                             ; preds = %bb89.bb70_crit_edge, %bb69
  %.05 = phi ptr [ %.06, %bb69 ], [ %i88, %bb89.bb70_crit_edge ]
  %i71 = getelementptr inbounds %struct.ptree, ptr %.05, i32 0, i32 3
  %i72 = load i8, ptr %i71, align 1
  %i73 = sext i8 %i72 to i32
  %i74 = getelementptr inbounds %struct.ptree, ptr %.05, i32 0, i32 3
  %i75 = load i8, ptr %i74, align 1
  %i76 = sext i8 %i75 to i32
  %i77 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 0
  %i78 = load i64, ptr %i77, align 8
  %i79 = call i64 @bit(i32 noundef %i76, i64 noundef %i78)
  %i80 = icmp ne i64 %i79, 0
  br i1 %i80, label %bb81, label %bb84

bb81:                                             ; preds = %bb70
  %i82 = getelementptr inbounds %struct.ptree, ptr %.05, i32 0, i32 5
  %i83 = load ptr, ptr %i82, align 8
  br label %bb87

bb84:                                             ; preds = %bb70
  %i85 = getelementptr inbounds %struct.ptree, ptr %.05, i32 0, i32 4
  %i86 = load ptr, ptr %i85, align 8
  br label %bb87

bb87:                                             ; preds = %bb84, %bb81
  %i88 = phi ptr [ %i83, %bb81 ], [ %i86, %bb84 ]
  br label %bb89

bb89:                                             ; preds = %bb87
  %i90 = getelementptr inbounds %struct.ptree, ptr %i88, i32 0, i32 3
  %i91 = load i8, ptr %i90, align 1
  %i92 = sext i8 %i91 to i32
  %i93 = icmp slt i32 %i73, %i92
  br i1 %i93, label %bb89.bb70_crit_edge, label %bb94, !llvm.loop !15

bb89.bb70_crit_edge:                              ; preds = %bb89
  br label %bb70

bb94:                                             ; preds = %bb89
  %i95 = getelementptr inbounds %struct.ptree, ptr %.05, i32 0, i32 3
  %i96 = load i8, ptr %i95, align 1
  %i97 = sext i8 %i96 to i32
  %i98 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 0
  %i99 = load i64, ptr %i98, align 8
  %i100 = call i64 @bit(i32 noundef %i97, i64 noundef %i99)
  %i101 = icmp ne i64 %i100, 0
  br i1 %i101, label %bb102, label %bb104

bb102:                                            ; preds = %bb94
  %i103 = getelementptr inbounds %struct.ptree, ptr %.05, i32 0, i32 5
  store ptr %i34, ptr %i103, align 8
  br label %bb106

bb104:                                            ; preds = %bb94
  %i105 = getelementptr inbounds %struct.ptree, ptr %.05, i32 0, i32 4
  store ptr %i34, ptr %i105, align 8
  br label %bb106

bb106:                                            ; preds = %bb104, %bb102
  %i107 = getelementptr inbounds %struct.ptree, ptr %.04, i32 0, i32 3
  %i108 = load i8, ptr %i107, align 1
  %i109 = sext i8 %i108 to i32
  %i110 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 0
  %i111 = load i64, ptr %i110, align 8
  %i112 = call i64 @bit(i32 noundef %i109, i64 noundef %i111)
  %i113 = icmp ne i64 %i112, 0
  br i1 %i113, label %bb114, label %bb131

bb114:                                            ; preds = %bb106
  %i115 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 3
  %i116 = load i8, ptr %i115, align 1
  %i117 = sext i8 %i116 to i32
  %i118 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 0
  %i119 = load i64, ptr %i118, align 8
  %i120 = call i64 @bit(i32 noundef %i117, i64 noundef %i119)
  %i121 = icmp ne i64 %i120, 0
  br i1 %i121, label %bb122, label %bb125

bb122:                                            ; preds = %bb114
  %i123 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 4
  %i124 = load ptr, ptr %i123, align 8
  br label %bb128

bb125:                                            ; preds = %bb114
  %i126 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 5
  %i127 = load ptr, ptr %i126, align 8
  br label %bb128

bb128:                                            ; preds = %bb125, %bb122
  %i129 = phi ptr [ %i124, %bb122 ], [ %i127, %bb125 ]
  %i130 = getelementptr inbounds %struct.ptree, ptr %.04, i32 0, i32 5
  store ptr %i129, ptr %i130, align 8
  br label %bb148

bb131:                                            ; preds = %bb106
  %i132 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 3
  %i133 = load i8, ptr %i132, align 1
  %i134 = sext i8 %i133 to i32
  %i135 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 0
  %i136 = load i64, ptr %i135, align 8
  %i137 = call i64 @bit(i32 noundef %i134, i64 noundef %i136)
  %i138 = icmp ne i64 %i137, 0
  br i1 %i138, label %bb139, label %bb142

bb139:                                            ; preds = %bb131
  %i140 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 4
  %i141 = load ptr, ptr %i140, align 8
  br label %bb145

bb142:                                            ; preds = %bb131
  %i143 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 5
  %i144 = load ptr, ptr %i143, align 8
  br label %bb145

bb145:                                            ; preds = %bb142, %bb139
  %i146 = phi ptr [ %i141, %bb139 ], [ %i144, %bb142 ]
  %i147 = getelementptr inbounds %struct.ptree, ptr %.04, i32 0, i32 4
  store ptr %i146, ptr %i147, align 8
  br label %bb148

bb148:                                            ; preds = %bb145, %bb128
  %i149 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 1
  %i150 = load ptr, ptr %i149, align 8
  %i151 = getelementptr inbounds %struct.ptree_mask, ptr %i150, i32 0, i32 1
  %i152 = load ptr, ptr %i151, align 8
  %i153 = icmp ne ptr %i152, null
  br i1 %i153, label %bb154, label %bb148.bb159_crit_edge

bb148.bb159_crit_edge:                            ; preds = %bb148
  br label %bb159

bb154:                                            ; preds = %bb148
  %i155 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 1
  %i156 = load ptr, ptr %i155, align 8
  %i157 = getelementptr inbounds %struct.ptree_mask, ptr %i156, i32 0, i32 1
  %i158 = load ptr, ptr %i157, align 8
  call void @free(ptr noundef %i158) #7
  br label %bb159

bb159:                                            ; preds = %bb154, %bb148.bb159_crit_edge
  %i160 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 1
  %i161 = load ptr, ptr %i160, align 8
  call void @free(ptr noundef %i161) #7
  %i162 = icmp ne ptr %i34, %.06
  br i1 %i162, label %bb163, label %bb159.bb173_crit_edge

bb159.bb173_crit_edge:                            ; preds = %bb159
  br label %bb173

bb163:                                            ; preds = %bb159
  %i164 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 0
  %i165 = load i64, ptr %i164, align 8
  %i166 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 0
  store i64 %i165, ptr %i166, align 8
  %i167 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 1
  %i168 = load ptr, ptr %i167, align 8
  %i169 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 1
  store ptr %i168, ptr %i169, align 8
  %i170 = getelementptr inbounds %struct.ptree, ptr %.06, i32 0, i32 2
  %i171 = load i8, ptr %i170, align 8
  %i172 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 2
  store i8 %i171, ptr %i172, align 8
  br label %bb173

bb173:                                            ; preds = %bb163, %bb159.bb173_crit_edge
  call void @free(ptr noundef %.06) #7
  br label %bb243

bb174:                                            ; preds = %bb47
  br label %bb175

bb175:                                            ; preds = %bb194, %bb174
  %.01 = phi i32 [ 0, %bb174 ], [ %i195, %bb194 ]
  %i176 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 2
  %i177 = load i8, ptr %i176, align 8
  %i178 = zext i8 %i177 to i32
  %i179 = icmp slt i32 %.01, %i178
  br i1 %i179, label %bb180, label %bb196.loopexit

bb180:                                            ; preds = %bb175
  %i181 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i182 = load ptr, ptr %i181, align 8
  %i183 = getelementptr inbounds %struct.ptree_mask, ptr %i182, i32 0, i32 0
  %i184 = load i64, ptr %i183, align 8
  %i185 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 1
  %i186 = load ptr, ptr %i185, align 8
  %i187 = sext i32 %.01 to i64
  %i188 = getelementptr inbounds %struct.ptree_mask, ptr %i186, i64 %i187
  %i189 = getelementptr inbounds %struct.ptree_mask, ptr %i188, i32 0, i32 0
  %i190 = load i64, ptr %i189, align 8
  %i191 = icmp eq i64 %i184, %i190
  br i1 %i191, label %bb192, label %bb193

bb192:                                            ; preds = %bb180
  br label %bb196

bb193:                                            ; preds = %bb180
  br label %bb194

bb194:                                            ; preds = %bb193
  %i195 = add nsw i32 %.01, 1
  br label %bb175, !llvm.loop !16

bb196.loopexit:                                   ; preds = %bb175
  br label %bb196

bb196:                                            ; preds = %bb196.loopexit, %bb192
  %i197 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 2
  %i198 = load i8, ptr %i197, align 8
  %i199 = zext i8 %i198 to i32
  %i200 = icmp sge i32 %.01, %i199
  br i1 %i200, label %bb201, label %bb202

bb201:                                            ; preds = %bb196
  br label %bb243

bb202:                                            ; preds = %bb196
  %i203 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 2
  %i204 = load i8, ptr %i203, align 8
  %i205 = zext i8 %i204 to i32
  %i206 = sub nsw i32 %i205, 1
  %i207 = sext i32 %i206 to i64
  %i208 = mul i64 16, %i207
  %i209 = call noalias ptr @malloc(i64 noundef %i208) #8
  br label %bb210

bb210:                                            ; preds = %bb234, %bb202
  %.02 = phi ptr [ %i209, %bb202 ], [ %.13, %bb234 ]
  %.1 = phi i32 [ 0, %bb202 ], [ %i235, %bb234 ]
  %i211 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 2
  %i212 = load i8, ptr %i211, align 8
  %i213 = zext i8 %i212 to i32
  %i214 = icmp slt i32 %.1, %i213
  br i1 %i214, label %bb215, label %bb236

bb215:                                            ; preds = %bb210
  %i216 = getelementptr inbounds %struct.ptree, ptr %arg, i32 0, i32 1
  %i217 = load ptr, ptr %i216, align 8
  %i218 = getelementptr inbounds %struct.ptree_mask, ptr %i217, i32 0, i32 0
  %i219 = load i64, ptr %i218, align 8
  %i220 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 1
  %i221 = load ptr, ptr %i220, align 8
  %i222 = sext i32 %.1 to i64
  %i223 = getelementptr inbounds %struct.ptree_mask, ptr %i221, i64 %i222
  %i224 = getelementptr inbounds %struct.ptree_mask, ptr %i223, i32 0, i32 0
  %i225 = load i64, ptr %i224, align 8
  %i226 = icmp ne i64 %i219, %i225
  br i1 %i226, label %bb227, label %bb215.bb233_crit_edge

bb215.bb233_crit_edge:                            ; preds = %bb215
  br label %bb233

bb227:                                            ; preds = %bb215
  %i228 = getelementptr inbounds %struct.ptree_mask, ptr %.02, i32 1
  %i229 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 1
  %i230 = load ptr, ptr %i229, align 8
  %i231 = sext i32 %.1 to i64
  %i232 = getelementptr inbounds %struct.ptree_mask, ptr %i230, i64 %i231
  call void @llvm.memmove.p0.p0.i64(ptr align 8 %.02, ptr align 8 %i232, i64 16, i1 false)
  br label %bb233

bb233:                                            ; preds = %bb227, %bb215.bb233_crit_edge
  %.13 = phi ptr [ %i228, %bb227 ], [ %.02, %bb215.bb233_crit_edge ]
  br label %bb234

bb234:                                            ; preds = %bb233
  %i235 = add nsw i32 %.1, 1
  br label %bb210, !llvm.loop !17

bb236:                                            ; preds = %bb210
  %i237 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 2
  %i238 = load i8, ptr %i237, align 8
  %i239 = add i8 %i238, -1
  store i8 %i239, ptr %i237, align 8
  %i240 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 1
  %i241 = load ptr, ptr %i240, align 8
  call void @free(ptr noundef %i241) #7
  %i242 = getelementptr inbounds %struct.ptree, ptr %i34, i32 0, i32 1
  store ptr %i209, ptr %i242, align 8
  br label %bb243

bb243:                                            ; preds = %bb236, %bb201, %bb173, %bb68, %bb57, %bb46, %bb14
  %.0 = phi i32 [ 0, %bb46 ], [ 0, %bb57 ], [ 0, %bb68 ], [ 1, %bb173 ], [ 0, %bb201 ], [ 1, %bb236 ], [ 0, %bb14 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @pat_search(i64 noundef %arg, ptr noundef %arg3) #0 {
bb:
  %i = icmp ne ptr %arg3, null
  br i1 %i, label %bb5, label %bb4

bb4:                                              ; preds = %bb
  br label %bb51

bb5:                                              ; preds = %bb
  br label %bb6

bb6:                                              ; preds = %bb33.bb6_crit_edge, %bb5
  %.02 = phi ptr [ null, %bb5 ], [ %.1, %bb33.bb6_crit_edge ]
  %.01 = phi ptr [ %arg3, %bb5 ], [ %i32, %bb33.bb6_crit_edge ]
  %i7 = getelementptr inbounds %struct.ptree, ptr %.01, i32 0, i32 0
  %i8 = load i64, ptr %i7, align 8
  %i9 = getelementptr inbounds %struct.ptree, ptr %.01, i32 0, i32 1
  %i10 = load ptr, ptr %i9, align 8
  %i11 = getelementptr inbounds %struct.ptree_mask, ptr %i10, i32 0, i32 0
  %i12 = load i64, ptr %i11, align 8
  %i13 = and i64 %arg, %i12
  %i14 = icmp eq i64 %i8, %i13
  br i1 %i14, label %bb15, label %bb6.bb16_crit_edge

bb6.bb16_crit_edge:                               ; preds = %bb6
  br label %bb16

bb15:                                             ; preds = %bb6
  br label %bb16

bb16:                                             ; preds = %bb15, %bb6.bb16_crit_edge
  %.1 = phi ptr [ %.01, %bb15 ], [ %.02, %bb6.bb16_crit_edge ]
  %i17 = getelementptr inbounds %struct.ptree, ptr %.01, i32 0, i32 3
  %i18 = load i8, ptr %i17, align 1
  %i19 = sext i8 %i18 to i32
  %i20 = getelementptr inbounds %struct.ptree, ptr %.01, i32 0, i32 3
  %i21 = load i8, ptr %i20, align 1
  %i22 = sext i8 %i21 to i32
  %i23 = call i64 @bit(i32 noundef %i22, i64 noundef %arg)
  %i24 = icmp ne i64 %i23, 0
  br i1 %i24, label %bb25, label %bb28

bb25:                                             ; preds = %bb16
  %i26 = getelementptr inbounds %struct.ptree, ptr %.01, i32 0, i32 5
  %i27 = load ptr, ptr %i26, align 8
  br label %bb31

bb28:                                             ; preds = %bb16
  %i29 = getelementptr inbounds %struct.ptree, ptr %.01, i32 0, i32 4
  %i30 = load ptr, ptr %i29, align 8
  br label %bb31

bb31:                                             ; preds = %bb28, %bb25
  %i32 = phi ptr [ %i27, %bb25 ], [ %i30, %bb28 ]
  br label %bb33

bb33:                                             ; preds = %bb31
  %i34 = getelementptr inbounds %struct.ptree, ptr %i32, i32 0, i32 3
  %i35 = load i8, ptr %i34, align 1
  %i36 = sext i8 %i35 to i32
  %i37 = icmp slt i32 %i19, %i36
  br i1 %i37, label %bb33.bb6_crit_edge, label %bb38, !llvm.loop !18

bb33.bb6_crit_edge:                               ; preds = %bb33
  br label %bb6

bb38:                                             ; preds = %bb33
  %i39 = getelementptr inbounds %struct.ptree, ptr %i32, i32 0, i32 0
  %i40 = load i64, ptr %i39, align 8
  %i41 = getelementptr inbounds %struct.ptree, ptr %i32, i32 0, i32 1
  %i42 = load ptr, ptr %i41, align 8
  %i43 = getelementptr inbounds %struct.ptree_mask, ptr %i42, i32 0, i32 0
  %i44 = load i64, ptr %i43, align 8
  %i45 = and i64 %arg, %i44
  %i46 = icmp eq i64 %i40, %i45
  br i1 %i46, label %bb47, label %bb48

bb47:                                             ; preds = %bb38
  br label %bb49

bb48:                                             ; preds = %bb38
  br label %bb49

bb49:                                             ; preds = %bb48, %bb47
  %i50 = phi ptr [ %i32, %bb47 ], [ %.1, %bb48 ]
  br label %bb51

bb51:                                             ; preds = %bb49, %bb4
  %.0 = phi ptr [ %i50, %bb49 ], [ null, %bb4 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main1(i32 noundef %arg, ptr noundef %arg1, i32 noundef %arg2) #0 {
bb:
  %i = alloca [128 x i8], align 16
  %i3 = alloca %struct.in_addr, align 4
  %i4 = alloca float, align 4
  %i5 = icmp slt i32 %arg, 2
  br i1 %i5, label %bb6, label %bb10

bb6:                                              ; preds = %bb
  %i7 = getelementptr inbounds ptr, ptr %arg1, i64 0
  %i8 = load ptr, ptr %i7, align 8
  %i9 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %i8)
  call void @exit(i32 noundef 1) #9
  unreachable

bb10:                                             ; preds = %bb
  %i11 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i12 = load ptr, ptr %i11, align 8
  %i13 = call noalias ptr @fopen(ptr noundef %i12, ptr noundef @.str.1.5)
  %i14 = icmp eq ptr %i13, null
  br i1 %i14, label %bb15, label %bb19

bb15:                                             ; preds = %bb10
  %i16 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i17 = load ptr, ptr %i16, align 8
  %i18 = call i32 (ptr, ...) @printf(ptr noundef @.str.2.6, ptr noundef %i17)
  call void @exit(i32 noundef 1) #9
  unreachable

bb19:                                             ; preds = %bb10
  %i20 = call noalias ptr @malloc(i64 noundef 40) #8
  %i21 = icmp ne ptr %i20, null
  br i1 %i21, label %bb23, label %bb22

bb22:                                             ; preds = %bb19
  call void @perror(ptr noundef @.str.3.7)
  call void @exit(i32 noundef 1) #9
  unreachable

bb23:                                             ; preds = %bb19
  call void @llvm.memset.p0.i64(ptr align 8 %i20, i8 0, i64 40, i1 false)
  %i24 = call noalias ptr @malloc(i64 noundef 16) #8
  %i25 = getelementptr inbounds %struct.ptree, ptr %i20, i32 0, i32 1
  store ptr %i24, ptr %i25, align 8
  %i26 = getelementptr inbounds %struct.ptree, ptr %i20, i32 0, i32 1
  %i27 = load ptr, ptr %i26, align 8
  %i28 = icmp ne ptr %i27, null
  br i1 %i28, label %bb30, label %bb29

bb29:                                             ; preds = %bb23
  call void @perror(ptr noundef @.str.4.8)
  call void @exit(i32 noundef 1) #9
  unreachable

bb30:                                             ; preds = %bb23
  %i31 = getelementptr inbounds %struct.ptree, ptr %i20, i32 0, i32 1
  %i32 = load ptr, ptr %i31, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %i32, i8 0, i64 16, i1 false)
  %i33 = getelementptr inbounds %struct.ptree, ptr %i20, i32 0, i32 1
  %i34 = load ptr, ptr %i33, align 8
  %i35 = call noalias ptr @malloc(i64 noundef 16) #8
  %i36 = getelementptr inbounds %struct.ptree_mask, ptr %i34, i32 0, i32 1
  store ptr %i35, ptr %i36, align 8
  %i37 = getelementptr inbounds %struct.ptree_mask, ptr %i34, i32 0, i32 1
  %i38 = load ptr, ptr %i37, align 8
  %i39 = icmp ne ptr %i38, null
  br i1 %i39, label %bb41, label %bb40

bb40:                                             ; preds = %bb30
  call void @perror(ptr noundef @.str.5)
  call void @exit(i32 noundef 1) #9
  unreachable

bb41:                                             ; preds = %bb30
  %i42 = getelementptr inbounds %struct.ptree_mask, ptr %i34, i32 0, i32 1
  %i43 = load ptr, ptr %i42, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %i43, i8 0, i64 1, i1 false)
  %i44 = getelementptr inbounds %struct.ptree, ptr %i20, i32 0, i32 2
  store i8 1, ptr %i44, align 8
  %i45 = getelementptr inbounds %struct.ptree, ptr %i20, i32 0, i32 5
  store ptr %i20, ptr %i45, align 8
  %i46 = getelementptr inbounds %struct.ptree, ptr %i20, i32 0, i32 4
  store ptr %i20, ptr %i46, align 8
  br label %bb47

bb47:                                             ; preds = %bb122, %bb41
  %i48 = getelementptr inbounds [128 x i8], ptr %i, i64 0, i64 0
  %i49 = call ptr @fgets(ptr noundef %i48, i32 noundef 128, ptr noundef %i13)
  %i50 = icmp ne ptr %i49, null
  br i1 %i50, label %bb51, label %bb123

bb51:                                             ; preds = %bb47
  %i52 = getelementptr inbounds [128 x i8], ptr %i, i64 0, i64 0
  %i53 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef %i52, ptr noundef @.str.6, ptr noundef %i4, ptr noundef %i3) #7
  %i54 = call noalias ptr @malloc(i64 noundef 40) #8
  %i55 = icmp ne ptr %i54, null
  br i1 %i55, label %bb57, label %bb56

bb56:                                             ; preds = %bb51
  call void @perror(ptr noundef @.str.3.7)
  call void @exit(i32 noundef 1) #9
  unreachable

bb57:                                             ; preds = %bb51
  call void @llvm.memset.p0.i64(ptr align 8 %i54, i8 0, i64 40, i1 false)
  %i58 = call noalias ptr @malloc(i64 noundef 16) #8
  %i59 = getelementptr inbounds %struct.ptree, ptr %i54, i32 0, i32 1
  store ptr %i58, ptr %i59, align 8
  %i60 = getelementptr inbounds %struct.ptree, ptr %i54, i32 0, i32 1
  %i61 = load ptr, ptr %i60, align 8
  %i62 = icmp ne ptr %i61, null
  br i1 %i62, label %bb64, label %bb63

bb63:                                             ; preds = %bb57
  call void @perror(ptr noundef @.str.4.8)
  call void @exit(i32 noundef 1) #9
  unreachable

bb64:                                             ; preds = %bb57
  %i65 = getelementptr inbounds %struct.ptree, ptr %i54, i32 0, i32 1
  %i66 = load ptr, ptr %i65, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %i66, i8 0, i64 16, i1 false)
  %i67 = getelementptr inbounds %struct.ptree, ptr %i54, i32 0, i32 1
  %i68 = load ptr, ptr %i67, align 8
  %i69 = call noalias ptr @malloc(i64 noundef 16) #8
  %i70 = getelementptr inbounds %struct.ptree_mask, ptr %i68, i32 0, i32 1
  store ptr %i69, ptr %i70, align 8
  %i71 = getelementptr inbounds %struct.ptree_mask, ptr %i68, i32 0, i32 1
  %i72 = load ptr, ptr %i71, align 8
  %i73 = icmp ne ptr %i72, null
  br i1 %i73, label %bb75, label %bb74

bb74:                                             ; preds = %bb64
  call void @perror(ptr noundef @.str.5)
  call void @exit(i32 noundef 1) #9
  unreachable

bb75:                                             ; preds = %bb64
  %i76 = getelementptr inbounds %struct.ptree_mask, ptr %i68, i32 0, i32 1
  %i77 = load ptr, ptr %i76, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %i77, i8 0, i64 1, i1 false)
  %i78 = getelementptr inbounds %struct.in_addr, ptr %i3, i32 0, i32 0
  %i79 = load i32, ptr %i78, align 4
  %i80 = zext i32 %i79 to i64
  %i81 = getelementptr inbounds %struct.ptree, ptr %i54, i32 0, i32 0
  store i64 %i80, ptr %i81, align 8
  %i82 = and i64 4294967295, 4278190080
  %i83 = lshr i64 %i82, 24
  %i84 = and i64 4294967295, 16711680
  %i85 = lshr i64 %i84, 8
  %i86 = or i64 %i83, %i85
  %i87 = and i64 4294967295, 65280
  %i88 = shl i64 %i87, 8
  %i89 = or i64 %i86, %i88
  %i90 = and i64 4294967295, 255
  %i91 = shl i64 %i90, 24
  %i92 = or i64 %i89, %i91
  %i93 = getelementptr inbounds %struct.ptree, ptr %i54, i32 0, i32 1
  %i94 = load ptr, ptr %i93, align 8
  %i95 = getelementptr inbounds %struct.ptree_mask, ptr %i94, i32 0, i32 0
  store i64 %i92, ptr %i95, align 8
  %i96 = getelementptr inbounds %struct.in_addr, ptr %i3, i32 0, i32 0
  %i97 = load i32, ptr %i96, align 4
  %i98 = zext i32 %i97 to i64
  %i99 = call ptr @pat_search(i64 noundef %i98, ptr noundef %i20)
  %i100 = getelementptr inbounds %struct.ptree, ptr %i99, i32 0, i32 0
  %i101 = load i64, ptr %i100, align 8
  %i102 = getelementptr inbounds %struct.in_addr, ptr %i3, i32 0, i32 0
  %i103 = load i32, ptr %i102, align 4
  %i104 = zext i32 %i103 to i64
  %i105 = icmp eq i64 %i101, %i104
  br i1 %i105, label %bb106, label %bb75.bb115_crit_edge

bb75.bb115_crit_edge:                             ; preds = %bb75
  br label %bb115

bb106:                                            ; preds = %bb75
  %i107 = icmp ne i32 %arg2, 0
  br i1 %i107, label %bb108, label %bb106.bb115_crit_edge

bb106.bb115_crit_edge:                            ; preds = %bb106
  br label %bb115

bb108:                                            ; preds = %bb106
  %i109 = load float, ptr %i4, align 4
  %i110 = fpext float %i109 to double
  %i111 = getelementptr inbounds %struct.in_addr, ptr %i3, i32 0, i32 0
  %i112 = load i32, ptr %i111, align 4
  %i113 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %i110, i32 noundef %i112)
  %i114 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %bb117

bb115:                                            ; preds = %bb106.bb115_crit_edge, %bb75.bb115_crit_edge
  %i116 = call ptr @pat_insert(ptr noundef %i54, ptr noundef %i20)
  br label %bb117

bb117:                                            ; preds = %bb115, %bb108
  %.0 = phi ptr [ %i54, %bb108 ], [ %i116, %bb115 ]
  %i118 = icmp ne ptr %.0, null
  br i1 %i118, label %bb122, label %bb119

bb119:                                            ; preds = %bb117
  %i120 = load ptr, ptr @stderr, align 8
  %i121 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i120, ptr noundef @.str.9)
  call void @exit(i32 noundef 1) #9
  unreachable

bb122:                                            ; preds = %bb117
  br label %bb47, !llvm.loop !19

bb123:                                            ; preds = %bb47
  %i124 = call i32 @fclose(ptr noundef %i13)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

declare void @perror(ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(ptr noundef, ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nounwind }
attributes #8 = { nounwind allocsize(0) }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5, !6, !7}

!0 = !{!"clang version 18.1.8 (https://github.com/llvm/llvm-project.git 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 1, !"ThinLTO", i32 0}
!7 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !9}
!17 = distinct !{!17, !9}
!18 = distinct !{!18, !9}
!19 = distinct !{!19, !9}
