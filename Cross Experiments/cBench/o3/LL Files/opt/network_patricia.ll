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
@stderr = external local_unnamed_addr global ptr, align 8
@.str.9 = private unnamed_addr constant [22 x i8] c"Failed on pat_insert\0A\00", align 1
@str = private unnamed_addr constant [7 x i8] c"Found.\00", align 1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #13
  %i2 = tail call noalias ptr @fopen(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1)
  %i3 = icmp eq ptr %i2, null
  br i1 %i3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i6 = tail call i64 @fwrite(ptr nonnull @.str.2, i64 28, i64 1, ptr %i5) #14
  br label %bb21

bb7:                                              ; preds = %bb
  %i8 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i2, ptr noundef nonnull @.str.3, ptr noundef nonnull %i) #13
  %i9 = call i32 @fclose(ptr noundef nonnull %i2)
  %i10 = load i64, ptr %i, align 8, !tbaa !12
  %i11 = icmp sgt i64 %i10, 0
  br i1 %i11, label %bb12.preheader, label %bb7.bb21_crit_edge

bb7.bb21_crit_edge:                               ; preds = %bb7
  br label %bb21

bb12.preheader:                                   ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb12.bb12_crit_edge, %bb12.preheader
  %i13 = phi i64 [ %i19, %bb12.bb12_crit_edge ], [ %i10, %bb12.preheader ]
  %i14 = phi i64 [ %i15, %bb12.bb12_crit_edge ], [ 0, %bb12.preheader ]
  %i15 = add nuw nsw i64 %i14, 1
  %i16 = icmp eq i64 %i15, %i13
  %i17 = zext i1 %i16 to i32
  %i18 = call i32 @main1(i32 noundef %arg, ptr noundef %arg1, i32 noundef %i17) #13
  %i19 = load i64, ptr %i, align 8, !tbaa !12
  %i20 = icmp slt i64 %i15, %i19
  br i1 %i20, label %bb12.bb12_crit_edge, label %bb21.loopexit, !llvm.loop !14

bb12.bb12_crit_edge:                              ; preds = %bb12
  br label %bb12

bb21.loopexit:                                    ; preds = %bb12
  br label %bb21

bb21:                                             ; preds = %bb7.bb21_crit_edge, %bb21.loopexit, %bb4
  %i22 = phi i32 [ 1, %bb4 ], [ 0, %bb7.bb21_crit_edge ], [ 0, %bb21.loopexit ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #13
  ret i32 %i22
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #3

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local ptr @pat_insert(ptr noundef %arg, ptr noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = icmp ne ptr %arg1, null
  %i2 = icmp ne ptr %arg, null
  %i3 = and i1 %i2, %i
  br i1 %i3, label %bb4, label %bb.bb201_crit_edge

bb.bb201_crit_edge:                               ; preds = %bb
  br label %bb201

bb4:                                              ; preds = %bb
  %i5 = getelementptr inbounds %struct.ptree, ptr %arg, i64 0, i32 1
  %i6 = load ptr, ptr %i5, align 8, !tbaa !16
  %i7 = icmp eq ptr %i6, null
  br i1 %i7, label %bb4.bb201_crit_edge, label %bb8

bb4.bb201_crit_edge:                              ; preds = %bb4
  br label %bb201

bb8:                                              ; preds = %bb4
  %i9 = load i64, ptr %i6, align 8, !tbaa !18
  %i10 = load i64, ptr %arg, align 8, !tbaa !20
  %i11 = and i64 %i10, %i9
  store i64 %i11, ptr %arg, align 8, !tbaa !20
  %i12 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 3
  %i13 = load i8, ptr %i12, align 1, !tbaa !21
  br label %bb14

bb14:                                             ; preds = %bb14.bb14_crit_edge, %bb8
  %i15 = phi i8 [ %i13, %bb8 ], [ %i27, %bb14.bb14_crit_edge ]
  %i16 = phi ptr [ %arg1, %bb8 ], [ %i25, %bb14.bb14_crit_edge ]
  %i17 = zext nneg i8 %i15 to i32
  %i18 = lshr exact i32 -2147483648, %i17
  %i19 = sext i32 %i18 to i64
  %i20 = and i64 %i11, %i19
  %i21 = icmp eq i64 %i20, 0
  %i22 = getelementptr inbounds %struct.ptree, ptr %i16, i64 0, i32 5
  %i23 = getelementptr inbounds %struct.ptree, ptr %i16, i64 0, i32 4
  %i24 = select i1 %i21, ptr %i23, ptr %i22
  %i25 = load ptr, ptr %i24, align 8, !tbaa !8
  %i26 = getelementptr inbounds %struct.ptree, ptr %i25, i64 0, i32 3
  %i27 = load i8, ptr %i26, align 1, !tbaa !21
  %i28 = icmp slt i8 %i15, %i27
  br i1 %i28, label %bb14.bb14_crit_edge, label %bb29, !llvm.loop !22

bb14.bb14_crit_edge:                              ; preds = %bb14
  br label %bb14

bb29:                                             ; preds = %bb14
  %i30 = load i64, ptr %i25, align 8, !tbaa !20
  %i31 = icmp eq i64 %i11, %i30
  br i1 %i31, label %bb36, label %bb32

bb32:                                             ; preds = %bb29
  %i33 = xor i64 %i30, %i11
  %i34 = and i64 %i33, 1073741824
  %i35 = icmp eq i64 %i34, 0
  br i1 %i35, label %bb95, label %bb32.bb186_crit_edge

bb32.bb186_crit_edge:                             ; preds = %bb32
  br label %bb186

bb36:                                             ; preds = %bb29
  %i37 = getelementptr inbounds %struct.ptree, ptr %i25, i64 0, i32 2
  %i38 = load i8, ptr %i37, align 8, !tbaa !23
  %i39 = zext i8 %i38 to i32
  %i40 = icmp eq i8 %i38, 0
  br i1 %i40, label %bb41, label %bb43

bb41:                                             ; preds = %bb36
  %i42 = tail call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #15
  br label %bb86

bb43:                                             ; preds = %bb36
  %i44 = getelementptr inbounds %struct.ptree, ptr %i25, i64 0, i32 1
  %i45 = load ptr, ptr %i44, align 8, !tbaa !16
  %i46 = zext i8 %i38 to i64
  br label %bb50

bb47:                                             ; preds = %bb50
  %i48 = add nuw nsw i64 %i51, 1
  %i49 = icmp eq i64 %i48, %i46
  br i1 %i49, label %bb59, label %bb47.bb50_crit_edge, !llvm.loop !24

bb47.bb50_crit_edge:                              ; preds = %bb47
  br label %bb50

bb50:                                             ; preds = %bb47.bb50_crit_edge, %bb43
  %i51 = phi i64 [ 0, %bb43 ], [ %i48, %bb47.bb50_crit_edge ]
  %i52 = getelementptr inbounds %struct.ptree_mask, ptr %i45, i64 %i51
  %i53 = load i64, ptr %i52, align 8, !tbaa !18
  %i54 = icmp eq i64 %i9, %i53
  br i1 %i54, label %bb55, label %bb47

bb55:                                             ; preds = %bb50
  %i56 = getelementptr inbounds %struct.ptree_mask, ptr %i6, i64 0, i32 1
  %i57 = load ptr, ptr %i56, align 8, !tbaa !25
  %i58 = getelementptr inbounds %struct.ptree_mask, ptr %i45, i64 %i51, i32 1
  store ptr %i57, ptr %i58, align 8, !tbaa !25
  tail call void @free(ptr noundef %i6) #13
  tail call void @free(ptr noundef %arg) #13
  br label %bb201

bb59:                                             ; preds = %bb47
  %i60 = shl nuw nsw i32 %i39, 4
  %i61 = add nuw nsw i32 %i60, 16
  %i62 = zext nneg i32 %i61 to i64
  %i63 = tail call noalias ptr @malloc(i64 noundef %i62) #15
  br i1 %i40, label %bb59.bb86_crit_edge, label %bb64

bb59.bb86_crit_edge:                              ; preds = %bb59
  br label %bb86

bb64:                                             ; preds = %bb59
  %i65 = getelementptr inbounds %struct.ptree, ptr %i25, i64 0, i32 1
  %i66 = load ptr, ptr %i65, align 8, !tbaa !16
  br label %bb67

bb67:                                             ; preds = %bb83.bb67_crit_edge, %bb64
  %i68 = phi i64 [ 4294967295, %bb83.bb67_crit_edge ], [ %i9, %bb64 ]
  %i69 = phi i1 [ false, %bb83.bb67_crit_edge ], [ true, %bb64 ]
  %i70 = phi i32 [ %i73, %bb83.bb67_crit_edge ], [ 0, %bb64 ]
  %i71 = phi ptr [ %i79, %bb83.bb67_crit_edge ], [ %i63, %bb64 ]
  br label %bb72

bb72:                                             ; preds = %bb80.bb72_crit_edge, %bb67
  %i73 = phi i32 [ %i81, %bb80.bb72_crit_edge ], [ %i70, %bb67 ]
  %i74 = phi ptr [ %i79, %bb80.bb72_crit_edge ], [ %i71, %bb67 ]
  %i75 = sext i32 %i73 to i64
  %i76 = getelementptr inbounds %struct.ptree_mask, ptr %i66, i64 %i75
  %i77 = load i64, ptr %i76, align 8, !tbaa !18
  %i78 = icmp ugt i64 %i68, %i77
  %i79 = getelementptr inbounds %struct.ptree_mask, ptr %i74, i64 1
  br i1 %i78, label %bb80, label %bb83

bb80:                                             ; preds = %bb72
  tail call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i74, ptr noundef nonnull align 8 dereferenceable(16) %i76, i64 16, i1 false)
  %i81 = add nsw i32 %i73, 1
  %i82 = icmp slt i32 %i81, %i39
  br i1 %i82, label %bb80.bb72_crit_edge, label %bb85, !llvm.loop !26

bb80.bb72_crit_edge:                              ; preds = %bb80
  br label %bb72

bb83:                                             ; preds = %bb72
  tail call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i74, ptr noundef nonnull align 8 dereferenceable(16) %i6, i64 16, i1 false)
  store i64 4294967295, ptr %i6, align 8, !tbaa !18
  %i84 = icmp slt i32 %i73, %i39
  br i1 %i84, label %bb83.bb67_crit_edge, label %bb89.loopexit, !llvm.loop !26

bb83.bb67_crit_edge:                              ; preds = %bb83
  br label %bb67

bb85:                                             ; preds = %bb80
  br i1 %i69, label %bb85.bb86_crit_edge, label %bb85.bb89_crit_edge

bb85.bb89_crit_edge:                              ; preds = %bb85
  br label %bb89

bb85.bb86_crit_edge:                              ; preds = %bb85
  br label %bb86

bb86:                                             ; preds = %bb85.bb86_crit_edge, %bb59.bb86_crit_edge, %bb41
  %i87 = phi ptr [ %i79, %bb85.bb86_crit_edge ], [ %i42, %bb41 ], [ %i63, %bb59.bb86_crit_edge ]
  %i88 = phi ptr [ %i63, %bb85.bb86_crit_edge ], [ %i42, %bb41 ], [ %i63, %bb59.bb86_crit_edge ]
  tail call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i87, ptr noundef nonnull align 8 dereferenceable(16) %i6, i64 16, i1 false)
  br label %bb89

bb89.loopexit:                                    ; preds = %bb83
  br label %bb89

bb89:                                             ; preds = %bb85.bb89_crit_edge, %bb89.loopexit, %bb86
  %i90 = phi ptr [ %i88, %bb86 ], [ %i63, %bb85.bb89_crit_edge ], [ %i63, %bb89.loopexit ]
  tail call void @free(ptr noundef %i6) #13
  tail call void @free(ptr noundef %arg) #13
  %i91 = load i8, ptr %i37, align 8, !tbaa !23
  %i92 = add i8 %i91, 1
  store i8 %i92, ptr %i37, align 8, !tbaa !23
  %i93 = getelementptr inbounds %struct.ptree, ptr %i25, i64 0, i32 1
  %i94 = load ptr, ptr %i93, align 8, !tbaa !16
  tail call void @free(ptr noundef %i94) #13
  store ptr %i90, ptr %i93, align 8, !tbaa !16
  br label %bb201

bb95:                                             ; preds = %bb32
  %i96 = and i64 %i33, 536870912
  %i97 = icmp eq i64 %i96, 0
  br i1 %i97, label %bb98, label %bb95.bb186_crit_edge

bb95.bb186_crit_edge:                             ; preds = %bb95
  br label %bb186

bb98:                                             ; preds = %bb95
  %i99 = and i64 %i33, 268435456
  %i100 = icmp eq i64 %i99, 0
  br i1 %i100, label %bb101, label %bb98.bb186_crit_edge

bb98.bb186_crit_edge:                             ; preds = %bb98
  br label %bb186

bb101:                                            ; preds = %bb98
  %i102 = and i64 %i33, 134217728
  %i103 = icmp eq i64 %i102, 0
  br i1 %i103, label %bb104, label %bb101.bb186_crit_edge

bb101.bb186_crit_edge:                            ; preds = %bb101
  br label %bb186

bb104:                                            ; preds = %bb101
  %i105 = and i64 %i33, 67108864
  %i106 = icmp eq i64 %i105, 0
  br i1 %i106, label %bb107, label %bb104.bb186_crit_edge

bb104.bb186_crit_edge:                            ; preds = %bb104
  br label %bb186

bb107:                                            ; preds = %bb104
  %i108 = and i64 %i33, 33554432
  %i109 = icmp eq i64 %i108, 0
  br i1 %i109, label %bb110, label %bb107.bb186_crit_edge

bb107.bb186_crit_edge:                            ; preds = %bb107
  br label %bb186

bb110:                                            ; preds = %bb107
  %i111 = and i64 %i33, 16777216
  %i112 = icmp eq i64 %i111, 0
  br i1 %i112, label %bb113, label %bb110.bb186_crit_edge

bb110.bb186_crit_edge:                            ; preds = %bb110
  br label %bb186

bb113:                                            ; preds = %bb110
  %i114 = and i64 %i33, 8388608
  %i115 = icmp eq i64 %i114, 0
  br i1 %i115, label %bb116, label %bb113.bb186_crit_edge

bb113.bb186_crit_edge:                            ; preds = %bb113
  br label %bb186

bb116:                                            ; preds = %bb113
  %i117 = and i64 %i33, 4194304
  %i118 = icmp eq i64 %i117, 0
  br i1 %i118, label %bb119, label %bb116.bb186_crit_edge

bb116.bb186_crit_edge:                            ; preds = %bb116
  br label %bb186

bb119:                                            ; preds = %bb116
  %i120 = and i64 %i33, 2097152
  %i121 = icmp eq i64 %i120, 0
  br i1 %i121, label %bb122, label %bb119.bb186_crit_edge

bb119.bb186_crit_edge:                            ; preds = %bb119
  br label %bb186

bb122:                                            ; preds = %bb119
  %i123 = and i64 %i33, 1048576
  %i124 = icmp eq i64 %i123, 0
  br i1 %i124, label %bb125, label %bb122.bb186_crit_edge

bb122.bb186_crit_edge:                            ; preds = %bb122
  br label %bb186

bb125:                                            ; preds = %bb122
  %i126 = and i64 %i33, 524288
  %i127 = icmp eq i64 %i126, 0
  br i1 %i127, label %bb128, label %bb125.bb186_crit_edge

bb125.bb186_crit_edge:                            ; preds = %bb125
  br label %bb186

bb128:                                            ; preds = %bb125
  %i129 = and i64 %i33, 262144
  %i130 = icmp eq i64 %i129, 0
  br i1 %i130, label %bb131, label %bb128.bb186_crit_edge

bb128.bb186_crit_edge:                            ; preds = %bb128
  br label %bb186

bb131:                                            ; preds = %bb128
  %i132 = and i64 %i33, 131072
  %i133 = icmp eq i64 %i132, 0
  br i1 %i133, label %bb134, label %bb131.bb186_crit_edge

bb131.bb186_crit_edge:                            ; preds = %bb131
  br label %bb186

bb134:                                            ; preds = %bb131
  %i135 = and i64 %i33, 65536
  %i136 = icmp eq i64 %i135, 0
  br i1 %i136, label %bb137, label %bb134.bb186_crit_edge

bb134.bb186_crit_edge:                            ; preds = %bb134
  br label %bb186

bb137:                                            ; preds = %bb134
  %i138 = and i64 %i33, 32768
  %i139 = icmp eq i64 %i138, 0
  br i1 %i139, label %bb140, label %bb137.bb186_crit_edge

bb137.bb186_crit_edge:                            ; preds = %bb137
  br label %bb186

bb140:                                            ; preds = %bb137
  %i141 = and i64 %i33, 16384
  %i142 = icmp eq i64 %i141, 0
  br i1 %i142, label %bb143, label %bb140.bb186_crit_edge

bb140.bb186_crit_edge:                            ; preds = %bb140
  br label %bb186

bb143:                                            ; preds = %bb140
  %i144 = and i64 %i33, 8192
  %i145 = icmp eq i64 %i144, 0
  br i1 %i145, label %bb146, label %bb143.bb186_crit_edge

bb143.bb186_crit_edge:                            ; preds = %bb143
  br label %bb186

bb146:                                            ; preds = %bb143
  %i147 = and i64 %i33, 4096
  %i148 = icmp eq i64 %i147, 0
  br i1 %i148, label %bb149, label %bb146.bb186_crit_edge

bb146.bb186_crit_edge:                            ; preds = %bb146
  br label %bb186

bb149:                                            ; preds = %bb146
  %i150 = and i64 %i33, 2048
  %i151 = icmp eq i64 %i150, 0
  br i1 %i151, label %bb152, label %bb149.bb186_crit_edge

bb149.bb186_crit_edge:                            ; preds = %bb149
  br label %bb186

bb152:                                            ; preds = %bb149
  %i153 = and i64 %i33, 1024
  %i154 = icmp eq i64 %i153, 0
  br i1 %i154, label %bb155, label %bb152.bb186_crit_edge

bb152.bb186_crit_edge:                            ; preds = %bb152
  br label %bb186

bb155:                                            ; preds = %bb152
  %i156 = and i64 %i33, 512
  %i157 = icmp eq i64 %i156, 0
  br i1 %i157, label %bb158, label %bb155.bb186_crit_edge

bb155.bb186_crit_edge:                            ; preds = %bb155
  br label %bb186

bb158:                                            ; preds = %bb155
  %i159 = and i64 %i33, 256
  %i160 = icmp eq i64 %i159, 0
  br i1 %i160, label %bb161, label %bb158.bb186_crit_edge

bb158.bb186_crit_edge:                            ; preds = %bb158
  br label %bb186

bb161:                                            ; preds = %bb158
  %i162 = and i64 %i33, 128
  %i163 = icmp eq i64 %i162, 0
  br i1 %i163, label %bb164, label %bb161.bb186_crit_edge

bb161.bb186_crit_edge:                            ; preds = %bb161
  br label %bb186

bb164:                                            ; preds = %bb161
  %i165 = and i64 %i33, 64
  %i166 = icmp eq i64 %i165, 0
  br i1 %i166, label %bb167, label %bb164.bb186_crit_edge

bb164.bb186_crit_edge:                            ; preds = %bb164
  br label %bb186

bb167:                                            ; preds = %bb164
  %i168 = and i64 %i33, 32
  %i169 = icmp eq i64 %i168, 0
  br i1 %i169, label %bb170, label %bb167.bb186_crit_edge

bb167.bb186_crit_edge:                            ; preds = %bb167
  br label %bb186

bb170:                                            ; preds = %bb167
  %i171 = and i64 %i33, 16
  %i172 = icmp eq i64 %i171, 0
  br i1 %i172, label %bb173, label %bb170.bb186_crit_edge

bb170.bb186_crit_edge:                            ; preds = %bb170
  br label %bb186

bb173:                                            ; preds = %bb170
  %i174 = and i64 %i33, 8
  %i175 = icmp eq i64 %i174, 0
  br i1 %i175, label %bb176, label %bb173.bb186_crit_edge

bb173.bb186_crit_edge:                            ; preds = %bb173
  br label %bb186

bb176:                                            ; preds = %bb173
  %i177 = and i64 %i33, 4
  %i178 = icmp eq i64 %i177, 0
  br i1 %i178, label %bb179, label %bb176.bb186_crit_edge

bb176.bb186_crit_edge:                            ; preds = %bb176
  br label %bb186

bb179:                                            ; preds = %bb176
  %i180 = and i64 %i33, 2
  %i181 = icmp eq i64 %i180, 0
  br i1 %i181, label %bb182, label %bb179.bb186_crit_edge

bb179.bb186_crit_edge:                            ; preds = %bb179
  br label %bb186

bb182:                                            ; preds = %bb179
  %i183 = and i64 %i33, 1
  %i184 = icmp eq i64 %i183, 0
  %i185 = select i1 %i184, i32 32, i32 31
  br label %bb186

bb186:                                            ; preds = %bb179.bb186_crit_edge, %bb176.bb186_crit_edge, %bb173.bb186_crit_edge, %bb170.bb186_crit_edge, %bb167.bb186_crit_edge, %bb164.bb186_crit_edge, %bb161.bb186_crit_edge, %bb158.bb186_crit_edge, %bb155.bb186_crit_edge, %bb152.bb186_crit_edge, %bb149.bb186_crit_edge, %bb146.bb186_crit_edge, %bb143.bb186_crit_edge, %bb140.bb186_crit_edge, %bb137.bb186_crit_edge, %bb134.bb186_crit_edge, %bb131.bb186_crit_edge, %bb128.bb186_crit_edge, %bb125.bb186_crit_edge, %bb122.bb186_crit_edge, %bb119.bb186_crit_edge, %bb116.bb186_crit_edge, %bb113.bb186_crit_edge, %bb110.bb186_crit_edge, %bb107.bb186_crit_edge, %bb104.bb186_crit_edge, %bb101.bb186_crit_edge, %bb98.bb186_crit_edge, %bb95.bb186_crit_edge, %bb32.bb186_crit_edge, %bb182
  %i187 = phi i32 [ 1, %bb32.bb186_crit_edge ], [ 2, %bb95.bb186_crit_edge ], [ 3, %bb98.bb186_crit_edge ], [ 4, %bb101.bb186_crit_edge ], [ 5, %bb104.bb186_crit_edge ], [ 6, %bb107.bb186_crit_edge ], [ 7, %bb110.bb186_crit_edge ], [ 8, %bb113.bb186_crit_edge ], [ 9, %bb116.bb186_crit_edge ], [ 10, %bb119.bb186_crit_edge ], [ 11, %bb122.bb186_crit_edge ], [ 12, %bb125.bb186_crit_edge ], [ 13, %bb128.bb186_crit_edge ], [ 14, %bb131.bb186_crit_edge ], [ 15, %bb134.bb186_crit_edge ], [ 16, %bb137.bb186_crit_edge ], [ 17, %bb140.bb186_crit_edge ], [ 18, %bb143.bb186_crit_edge ], [ 19, %bb146.bb186_crit_edge ], [ 20, %bb149.bb186_crit_edge ], [ 21, %bb152.bb186_crit_edge ], [ 22, %bb155.bb186_crit_edge ], [ 23, %bb158.bb186_crit_edge ], [ 24, %bb161.bb186_crit_edge ], [ 25, %bb164.bb186_crit_edge ], [ 26, %bb167.bb186_crit_edge ], [ 27, %bb170.bb186_crit_edge ], [ 28, %bb173.bb186_crit_edge ], [ 29, %bb176.bb186_crit_edge ], [ 30, %bb179.bb186_crit_edge ], [ %i185, %bb182 ]
  %i188 = zext nneg i8 %i13 to i32
  %i189 = lshr exact i32 -2147483648, %i188
  %i190 = sext i32 %i189 to i64
  %i191 = and i64 %i11, %i190
  %i192 = icmp eq i64 %i191, 0
  br i1 %i192, label %bb197, label %bb193

bb193:                                            ; preds = %bb186
  %i194 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 5
  %i195 = load ptr, ptr %i194, align 8, !tbaa !27
  %i196 = tail call fastcc ptr @insertR(ptr noundef %i195, ptr noundef nonnull %arg, i32 noundef %i187, ptr noundef nonnull %arg1)
  store ptr %i196, ptr %i194, align 8, !tbaa !27
  br label %bb201

bb197:                                            ; preds = %bb186
  %i198 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 4
  %i199 = load ptr, ptr %i198, align 8, !tbaa !28
  %i200 = tail call fastcc ptr @insertR(ptr noundef %i199, ptr noundef nonnull %arg, i32 noundef %i187, ptr noundef nonnull %arg1)
  store ptr %i200, ptr %i198, align 8, !tbaa !28
  br label %bb201

bb201:                                            ; preds = %bb4.bb201_crit_edge, %bb.bb201_crit_edge, %bb197, %bb193, %bb89, %bb55
  %i202 = phi ptr [ %i25, %bb55 ], [ %i25, %bb89 ], [ null, %bb4.bb201_crit_edge ], [ null, %bb.bb201_crit_edge ], [ %arg, %bb197 ], [ %arg, %bb193 ]
  ret ptr %i202
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #6

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #7

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define internal fastcc noundef ptr @insertR(ptr noundef %arg, ptr noundef %arg1, i32 noundef %arg2, ptr nocapture noundef readonly %arg3) unnamed_addr #8 {
bb:
  %i = getelementptr inbounds %struct.ptree, ptr %arg, i64 0, i32 3
  %i4 = load i8, ptr %i, align 1, !tbaa !21
  %i5 = sext i8 %i4 to i32
  %i6 = icmp slt i32 %i5, %arg2
  br i1 %i6, label %bb7, label %bb.bb11_crit_edge

bb.bb11_crit_edge:                                ; preds = %bb
  br label %bb11

bb7:                                              ; preds = %bb
  %i8 = getelementptr inbounds %struct.ptree, ptr %arg3, i64 0, i32 3
  %i9 = load i8, ptr %i8, align 1, !tbaa !21
  %i10 = icmp sgt i8 %i4, %i9
  br i1 %i10, label %bb23, label %bb7.bb11_crit_edge

bb7.bb11_crit_edge:                               ; preds = %bb7
  br label %bb11

bb11:                                             ; preds = %bb7.bb11_crit_edge, %bb.bb11_crit_edge
  %i12 = trunc i32 %arg2 to i8
  %i13 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 3
  store i8 %i12, ptr %i13, align 1, !tbaa !21
  %i14 = load i64, ptr %arg1, align 8, !tbaa !20
  %i15 = lshr exact i32 -2147483648, %arg2
  %i16 = sext i32 %i15 to i64
  %i17 = and i64 %i14, %i16
  %i18 = icmp eq i64 %i17, 0
  %i19 = select i1 %i18, ptr %arg1, ptr %arg
  %i20 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 4
  store ptr %i19, ptr %i20, align 8, !tbaa !28
  %i21 = select i1 %i18, ptr %arg, ptr %arg1
  %i22 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 5
  store ptr %i21, ptr %i22, align 8, !tbaa !27
  br label %bb29

bb23:                                             ; preds = %bb7
  %i24 = load i64, ptr %arg1, align 8, !tbaa !20
  %i25 = lshr exact i32 -2147483648, %i5
  %i26 = sext i32 %i25 to i64
  %i27 = and i64 %i24, %i26
  %i28 = icmp eq i64 %i27, 0
  br i1 %i28, label %bb35, label %bb31

bb29:                                             ; preds = %bb35, %bb31, %bb11
  %i30 = phi ptr [ %arg1, %bb11 ], [ %arg, %bb31 ], [ %arg, %bb35 ]
  ret ptr %i30

bb31:                                             ; preds = %bb23
  %i32 = getelementptr inbounds %struct.ptree, ptr %arg, i64 0, i32 5
  %i33 = load ptr, ptr %i32, align 8, !tbaa !27
  %i34 = tail call fastcc ptr @insertR(ptr noundef %i33, ptr noundef nonnull %arg1, i32 noundef %arg2, ptr noundef nonnull %arg)
  store ptr %i34, ptr %i32, align 8, !tbaa !27
  br label %bb29

bb35:                                             ; preds = %bb23
  %i36 = getelementptr inbounds %struct.ptree, ptr %arg, i64 0, i32 4
  %i37 = load ptr, ptr %i36, align 8, !tbaa !28
  %i38 = tail call fastcc ptr @insertR(ptr noundef %i37, ptr noundef nonnull %arg1, i32 noundef %arg2, ptr noundef nonnull %arg)
  store ptr %i38, ptr %i36, align 8, !tbaa !28
  br label %bb29
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef i32 @pat_remove(ptr nocapture noundef readnone %arg, ptr nocapture noundef readnone %arg1) local_unnamed_addr #9 {
bb:
  ret i32 0
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local ptr @pat_search(i64 noundef %arg, ptr noundef readonly %arg1) local_unnamed_addr #10 {
bb:
  %i = icmp eq ptr %arg1, null
  br i1 %i, label %bb.bb36_crit_edge, label %bb2

bb.bb36_crit_edge:                                ; preds = %bb
  br label %bb36

bb2:                                              ; preds = %bb
  %i3 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 3
  %i4 = load i8, ptr %i3, align 1, !tbaa !21
  br label %bb5

bb5:                                              ; preds = %bb5.bb5_crit_edge, %bb2
  %i6 = phi i8 [ %i26, %bb5.bb5_crit_edge ], [ %i4, %bb2 ]
  %i7 = phi ptr [ %i15, %bb5.bb5_crit_edge ], [ null, %bb2 ]
  %i8 = phi ptr [ %i24, %bb5.bb5_crit_edge ], [ %arg1, %bb2 ]
  %i9 = load i64, ptr %i8, align 8, !tbaa !20
  %i10 = getelementptr inbounds %struct.ptree, ptr %i8, i64 0, i32 1
  %i11 = load ptr, ptr %i10, align 8, !tbaa !16
  %i12 = load i64, ptr %i11, align 8, !tbaa !18
  %i13 = and i64 %i12, %arg
  %i14 = icmp eq i64 %i9, %i13
  %i15 = select i1 %i14, ptr %i8, ptr %i7
  %i16 = zext nneg i8 %i6 to i32
  %i17 = lshr exact i32 -2147483648, %i16
  %i18 = sext i32 %i17 to i64
  %i19 = and i64 %i18, %arg
  %i20 = icmp eq i64 %i19, 0
  %i21 = getelementptr inbounds %struct.ptree, ptr %i8, i64 0, i32 5
  %i22 = getelementptr inbounds %struct.ptree, ptr %i8, i64 0, i32 4
  %i23 = select i1 %i20, ptr %i22, ptr %i21
  %i24 = load ptr, ptr %i23, align 8, !tbaa !8
  %i25 = getelementptr inbounds %struct.ptree, ptr %i24, i64 0, i32 3
  %i26 = load i8, ptr %i25, align 1, !tbaa !21
  %i27 = icmp slt i8 %i6, %i26
  br i1 %i27, label %bb5.bb5_crit_edge, label %bb28, !llvm.loop !29

bb5.bb5_crit_edge:                                ; preds = %bb5
  br label %bb5

bb28:                                             ; preds = %bb5
  %i29 = load i64, ptr %i24, align 8, !tbaa !20
  %i30 = getelementptr inbounds %struct.ptree, ptr %i24, i64 0, i32 1
  %i31 = load ptr, ptr %i30, align 8, !tbaa !16
  %i32 = load i64, ptr %i31, align 8, !tbaa !18
  %i33 = and i64 %i32, %arg
  %i34 = icmp eq i64 %i29, %i33
  %i35 = select i1 %i34, ptr %i24, ptr %i15
  br label %bb36

bb36:                                             ; preds = %bb.bb36_crit_edge, %bb28
  %i37 = phi ptr [ %i35, %bb28 ], [ null, %bb.bb36_crit_edge ]
  ret ptr %i37
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main1(i32 noundef %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2) local_unnamed_addr #0 {
bb:
  %i = alloca [128 x i8], align 16
  %i3 = alloca %struct.in_addr, align 4
  %i4 = alloca float, align 4
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %i) #13
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i3) #13
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i4) #13
  %i5 = icmp slt i32 %arg, 2
  br i1 %i5, label %bb6, label %bb9

bb6:                                              ; preds = %bb
  %i7 = load ptr, ptr %arg1, align 8, !tbaa !8
  %i8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, ptr noundef %i7)
  tail call void @exit(i32 noundef 1) #16
  unreachable

bb9:                                              ; preds = %bb
  %i10 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i11 = load ptr, ptr %i10, align 8, !tbaa !8
  %i12 = tail call noalias ptr @fopen(ptr noundef %i11, ptr noundef nonnull @.str.1.5)
  %i13 = icmp eq ptr %i12, null
  br i1 %i13, label %bb14, label %bb17

bb14:                                             ; preds = %bb9
  %i15 = load ptr, ptr %i10, align 8, !tbaa !8
  %i16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2.6, ptr noundef %i15)
  tail call void @exit(i32 noundef 1) #16
  unreachable

bb17:                                             ; preds = %bb9
  %i18 = tail call dereferenceable_or_null(40) ptr @calloc(i64 1, i64 40)
  %i19 = icmp eq ptr %i18, null
  br i1 %i19, label %bb20, label %bb21

bb20:                                             ; preds = %bb17
  tail call void @perror(ptr noundef nonnull @.str.3.7) #14
  tail call void @exit(i32 noundef 1) #16
  unreachable

bb21:                                             ; preds = %bb17
  %i22 = tail call dereferenceable_or_null(16) ptr @calloc(i64 1, i64 16)
  %i23 = getelementptr inbounds %struct.ptree, ptr %i18, i64 0, i32 1
  store ptr %i22, ptr %i23, align 8, !tbaa !16
  %i24 = icmp eq ptr %i22, null
  br i1 %i24, label %bb25, label %bb26

bb25:                                             ; preds = %bb21
  tail call void @perror(ptr noundef nonnull @.str.4.8) #14
  tail call void @exit(i32 noundef 1) #16
  unreachable

bb26:                                             ; preds = %bb21
  %i27 = tail call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #15
  %i28 = getelementptr inbounds %struct.ptree_mask, ptr %i22, i64 0, i32 1
  store ptr %i27, ptr %i28, align 8, !tbaa !25
  %i29 = icmp eq ptr %i27, null
  br i1 %i29, label %bb30, label %bb31

bb30:                                             ; preds = %bb26
  tail call void @perror(ptr noundef nonnull @.str.5) #14
  tail call void @exit(i32 noundef 1) #16
  unreachable

bb31:                                             ; preds = %bb26
  store i8 0, ptr %i27, align 1
  %i32 = getelementptr inbounds %struct.ptree, ptr %i18, i64 0, i32 2
  store i8 1, ptr %i32, align 8, !tbaa !23
  %i33 = getelementptr inbounds %struct.ptree, ptr %i18, i64 0, i32 5
  store ptr %i18, ptr %i33, align 8, !tbaa !27
  %i34 = getelementptr inbounds %struct.ptree, ptr %i18, i64 0, i32 4
  store ptr %i18, ptr %i34, align 8, !tbaa !28
  %i35 = icmp eq i32 %arg2, 0
  br i1 %i35, label %bb36.preheader, label %bb57.preheader

bb57.preheader:                                   ; preds = %bb31
  br label %bb57

bb36.preheader:                                   ; preds = %bb31
  br label %bb36

bb36:                                             ; preds = %bb51.bb36_crit_edge, %bb36.preheader
  %i37 = call ptr @fgets(ptr noundef nonnull %i, i32 noundef 128, ptr noundef nonnull %i12)
  %i38 = icmp eq ptr %i37, null
  br i1 %i38, label %bb96.loopexit, label %bb39

bb39:                                             ; preds = %bb36
  %i40 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef nonnull %i, ptr noundef nonnull @.str.6, ptr noundef nonnull %i4, ptr noundef nonnull %i3) #13
  %i41 = call dereferenceable_or_null(40) ptr @calloc(i64 1, i64 40)
  %i42 = icmp eq ptr %i41, null
  br i1 %i42, label %bb64.loopexit, label %bb43

bb43:                                             ; preds = %bb39
  %i44 = call dereferenceable_or_null(16) ptr @calloc(i64 1, i64 16)
  %i45 = getelementptr inbounds %struct.ptree, ptr %i41, i64 0, i32 1
  store ptr %i44, ptr %i45, align 8, !tbaa !16
  %i46 = icmp eq ptr %i44, null
  br i1 %i46, label %bb69.loopexit, label %bb47

bb47:                                             ; preds = %bb43
  %i48 = call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #15
  %i49 = getelementptr inbounds %struct.ptree_mask, ptr %i44, i64 0, i32 1
  store ptr %i48, ptr %i49, align 8, !tbaa !25
  %i50 = icmp eq ptr %i48, null
  br i1 %i50, label %bb74.loopexit, label %bb51

bb51:                                             ; preds = %bb47
  store i8 0, ptr %i48, align 1
  %i52 = load i32, ptr %i3, align 4, !tbaa !30
  %i53 = zext i32 %i52 to i64
  store i64 %i53, ptr %i41, align 8, !tbaa !20
  store i64 4294967295, ptr %i44, align 8, !tbaa !18
  %i54 = call ptr @pat_search(i64 noundef %i53, ptr noundef nonnull %i18) #13
  %i55 = call ptr @pat_insert(ptr noundef nonnull %i41, ptr noundef nonnull %i18) #13
  %i56 = icmp eq ptr %i55, null
  br i1 %i56, label %bb93.loopexit, label %bb51.bb36_crit_edge, !llvm.loop !33

bb51.bb36_crit_edge:                              ; preds = %bb51
  br label %bb36

bb57:                                             ; preds = %bb90.bb57_crit_edge, %bb57.preheader
  %i58 = call ptr @fgets(ptr noundef nonnull %i, i32 noundef 128, ptr noundef nonnull %i12)
  %i59 = icmp eq ptr %i58, null
  br i1 %i59, label %bb96.loopexit1, label %bb60

bb60:                                             ; preds = %bb57
  %i61 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef nonnull %i, ptr noundef nonnull @.str.6, ptr noundef nonnull %i4, ptr noundef nonnull %i3) #13
  %i62 = call dereferenceable_or_null(40) ptr @calloc(i64 1, i64 40)
  %i63 = icmp eq ptr %i62, null
  br i1 %i63, label %bb64.loopexit2, label %bb65

bb64.loopexit:                                    ; preds = %bb39
  br label %bb64

bb64.loopexit2:                                   ; preds = %bb60
  br label %bb64

bb64:                                             ; preds = %bb64.loopexit2, %bb64.loopexit
  call void @perror(ptr noundef nonnull @.str.3.7) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb65:                                             ; preds = %bb60
  %i66 = call dereferenceable_or_null(16) ptr @calloc(i64 1, i64 16)
  %i67 = getelementptr inbounds %struct.ptree, ptr %i62, i64 0, i32 1
  store ptr %i66, ptr %i67, align 8, !tbaa !16
  %i68 = icmp eq ptr %i66, null
  br i1 %i68, label %bb69.loopexit3, label %bb70

bb69.loopexit:                                    ; preds = %bb43
  br label %bb69

bb69.loopexit3:                                   ; preds = %bb65
  br label %bb69

bb69:                                             ; preds = %bb69.loopexit3, %bb69.loopexit
  call void @perror(ptr noundef nonnull @.str.4.8) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb70:                                             ; preds = %bb65
  %i71 = call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #15
  %i72 = getelementptr inbounds %struct.ptree_mask, ptr %i66, i64 0, i32 1
  store ptr %i71, ptr %i72, align 8, !tbaa !25
  %i73 = icmp eq ptr %i71, null
  br i1 %i73, label %bb74.loopexit4, label %bb75

bb74.loopexit:                                    ; preds = %bb47
  br label %bb74

bb74.loopexit4:                                   ; preds = %bb70
  br label %bb74

bb74:                                             ; preds = %bb74.loopexit4, %bb74.loopexit
  call void @perror(ptr noundef nonnull @.str.5) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb75:                                             ; preds = %bb70
  store i8 0, ptr %i71, align 1
  %i76 = load i32, ptr %i3, align 4, !tbaa !30
  %i77 = zext i32 %i76 to i64
  store i64 %i77, ptr %i62, align 8, !tbaa !20
  store i64 4294967295, ptr %i66, align 8, !tbaa !18
  %i78 = call ptr @pat_search(i64 noundef %i77, ptr noundef nonnull %i18) #13
  %i79 = load i64, ptr %i78, align 8, !tbaa !20
  %i80 = load i32, ptr %i3, align 4, !tbaa !30
  %i81 = zext i32 %i80 to i64
  %i82 = icmp eq i64 %i79, %i81
  br i1 %i82, label %bb83, label %bb88

bb83:                                             ; preds = %bb75
  %i84 = load float, ptr %i4, align 4, !tbaa !34
  %i85 = fpext float %i84 to double
  %i86 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, double noundef %i85, i32 noundef %i80)
  %i87 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %bb90

bb88:                                             ; preds = %bb75
  %i89 = call ptr @pat_insert(ptr noundef nonnull %i62, ptr noundef nonnull %i18) #13
  br label %bb90

bb90:                                             ; preds = %bb88, %bb83
  %i91 = phi ptr [ %i62, %bb83 ], [ %i89, %bb88 ]
  %i92 = icmp eq ptr %i91, null
  br i1 %i92, label %bb93.loopexit5, label %bb90.bb57_crit_edge, !llvm.loop !33

bb90.bb57_crit_edge:                              ; preds = %bb90
  br label %bb57

bb93.loopexit:                                    ; preds = %bb51
  br label %bb93

bb93.loopexit5:                                   ; preds = %bb90
  br label %bb93

bb93:                                             ; preds = %bb93.loopexit5, %bb93.loopexit
  %i94 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i95 = call i64 @fwrite(ptr nonnull @.str.9, i64 21, i64 1, ptr %i94) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb96.loopexit:                                    ; preds = %bb36
  br label %bb96

bb96.loopexit1:                                   ; preds = %bb57
  br label %bb96

bb96:                                             ; preds = %bb96.loopexit1, %bb96.loopexit
  %i97 = call i32 @fclose(ptr noundef nonnull %i12)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i4) #13
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i3) #13
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %i) #13
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare void @perror(ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef ptr @fgets(ptr noundef, i32 noundef, ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @__isoc99_sscanf(ptr nocapture noundef readonly, ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nofree nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #13 = { nounwind }
attributes #14 = { cold }
attributes #15 = { nounwind allocsize(0) }
attributes #16 = { noreturn nounwind }

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
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!17, !9, i64 8}
!17 = !{!"ptree", !13, i64 0, !9, i64 8, !10, i64 16, !10, i64 17, !9, i64 24, !9, i64 32}
!18 = !{!19, !13, i64 0}
!19 = !{!"ptree_mask", !13, i64 0, !9, i64 8}
!20 = !{!17, !13, i64 0}
!21 = !{!17, !10, i64 17}
!22 = distinct !{!22, !15}
!23 = !{!17, !10, i64 16}
!24 = distinct !{!24, !15}
!25 = !{!19, !9, i64 8}
!26 = distinct !{!26, !15}
!27 = !{!17, !9, i64 32}
!28 = !{!17, !9, i64 24}
!29 = distinct !{!29, !15}
!30 = !{!31, !32, i64 0}
!31 = !{!"in_addr", !32, i64 0}
!32 = !{!"int", !10, i64 0}
!33 = distinct !{!33, !15}
!34 = !{!35, !35, i64 0}
!35 = !{!"float", !10, i64 0}
