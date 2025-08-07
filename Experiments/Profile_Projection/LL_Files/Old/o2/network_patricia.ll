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

bb21:                                             ; preds = %bb21.loopexit, %bb7.bb21_crit_edge, %bb4
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
  br i1 %i3, label %bb4, label %bb.bb138_crit_edge

bb.bb138_crit_edge:                               ; preds = %bb
  br label %bb138

bb4:                                              ; preds = %bb
  %i5 = getelementptr inbounds %struct.ptree, ptr %arg, i64 0, i32 1
  %i6 = load ptr, ptr %i5, align 8, !tbaa !16
  %i7 = icmp eq ptr %i6, null
  br i1 %i7, label %bb4.bb138_crit_edge, label %bb8

bb4.bb138_crit_edge:                              ; preds = %bb4
  br label %bb138

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
  br i1 %i31, label %bb34, label %bb32

bb32:                                             ; preds = %bb29
  %i33 = xor i64 %i30, %i11
  br label %bb93

bb34:                                             ; preds = %bb29
  %i35 = getelementptr inbounds %struct.ptree, ptr %i25, i64 0, i32 2
  %i36 = load i8, ptr %i35, align 8, !tbaa !23
  %i37 = zext i8 %i36 to i32
  %i38 = icmp eq i8 %i36, 0
  br i1 %i38, label %bb39, label %bb41

bb39:                                             ; preds = %bb34
  %i40 = tail call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #15
  br label %bb84

bb41:                                             ; preds = %bb34
  %i42 = getelementptr inbounds %struct.ptree, ptr %i25, i64 0, i32 1
  %i43 = load ptr, ptr %i42, align 8, !tbaa !16
  %i44 = zext i8 %i36 to i64
  br label %bb48

bb45:                                             ; preds = %bb48
  %i46 = add nuw nsw i64 %i49, 1
  %i47 = icmp eq i64 %i46, %i44
  br i1 %i47, label %bb57, label %bb45.bb48_crit_edge, !llvm.loop !24

bb45.bb48_crit_edge:                              ; preds = %bb45
  br label %bb48

bb48:                                             ; preds = %bb45.bb48_crit_edge, %bb41
  %i49 = phi i64 [ 0, %bb41 ], [ %i46, %bb45.bb48_crit_edge ]
  %i50 = getelementptr inbounds %struct.ptree_mask, ptr %i43, i64 %i49
  %i51 = load i64, ptr %i50, align 8, !tbaa !18
  %i52 = icmp eq i64 %i9, %i51
  br i1 %i52, label %bb53, label %bb45

bb53:                                             ; preds = %bb48
  %i54 = getelementptr inbounds %struct.ptree_mask, ptr %i6, i64 0, i32 1
  %i55 = load ptr, ptr %i54, align 8, !tbaa !25
  %i56 = getelementptr inbounds %struct.ptree_mask, ptr %i43, i64 %i49, i32 1
  store ptr %i55, ptr %i56, align 8, !tbaa !25
  tail call void @free(ptr noundef %i6) #13
  tail call void @free(ptr noundef %arg) #13
  br label %bb138

bb57:                                             ; preds = %bb45
  %i58 = shl nuw nsw i32 %i37, 4
  %i59 = add nuw nsw i32 %i58, 16
  %i60 = zext nneg i32 %i59 to i64
  %i61 = tail call noalias ptr @malloc(i64 noundef %i60) #15
  br i1 %i38, label %bb57.bb84_crit_edge, label %bb62

bb57.bb84_crit_edge:                              ; preds = %bb57
  br label %bb84

bb62:                                             ; preds = %bb57
  %i63 = getelementptr inbounds %struct.ptree, ptr %i25, i64 0, i32 1
  %i64 = load ptr, ptr %i63, align 8, !tbaa !16
  br label %bb65

bb65:                                             ; preds = %bb81.bb65_crit_edge, %bb62
  %i66 = phi i64 [ 4294967295, %bb81.bb65_crit_edge ], [ %i9, %bb62 ]
  %i67 = phi i1 [ false, %bb81.bb65_crit_edge ], [ true, %bb62 ]
  %i68 = phi i32 [ %i71, %bb81.bb65_crit_edge ], [ 0, %bb62 ]
  %i69 = phi ptr [ %i77, %bb81.bb65_crit_edge ], [ %i61, %bb62 ]
  br label %bb70

bb70:                                             ; preds = %bb78.bb70_crit_edge, %bb65
  %i71 = phi i32 [ %i79, %bb78.bb70_crit_edge ], [ %i68, %bb65 ]
  %i72 = phi ptr [ %i77, %bb78.bb70_crit_edge ], [ %i69, %bb65 ]
  %i73 = sext i32 %i71 to i64
  %i74 = getelementptr inbounds %struct.ptree_mask, ptr %i64, i64 %i73
  %i75 = load i64, ptr %i74, align 8, !tbaa !18
  %i76 = icmp ugt i64 %i66, %i75
  %i77 = getelementptr inbounds %struct.ptree_mask, ptr %i72, i64 1
  br i1 %i76, label %bb78, label %bb81

bb78:                                             ; preds = %bb70
  tail call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i72, ptr noundef nonnull align 8 dereferenceable(16) %i74, i64 16, i1 false)
  %i79 = add nsw i32 %i71, 1
  %i80 = icmp slt i32 %i79, %i37
  br i1 %i80, label %bb78.bb70_crit_edge, label %bb83, !llvm.loop !26

bb78.bb70_crit_edge:                              ; preds = %bb78
  br label %bb70

bb81:                                             ; preds = %bb70
  tail call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i72, ptr noundef nonnull align 8 dereferenceable(16) %i6, i64 16, i1 false)
  store i64 4294967295, ptr %i6, align 8, !tbaa !18
  %i82 = icmp slt i32 %i71, %i37
  br i1 %i82, label %bb81.bb65_crit_edge, label %bb87.loopexit, !llvm.loop !26

bb81.bb65_crit_edge:                              ; preds = %bb81
  br label %bb65

bb83:                                             ; preds = %bb78
  br i1 %i67, label %bb83.bb84_crit_edge, label %bb83.bb87_crit_edge

bb83.bb87_crit_edge:                              ; preds = %bb83
  br label %bb87

bb83.bb84_crit_edge:                              ; preds = %bb83
  br label %bb84

bb84:                                             ; preds = %bb83.bb84_crit_edge, %bb57.bb84_crit_edge, %bb39
  %i85 = phi ptr [ %i77, %bb83.bb84_crit_edge ], [ %i40, %bb39 ], [ %i61, %bb57.bb84_crit_edge ]
  %i86 = phi ptr [ %i61, %bb83.bb84_crit_edge ], [ %i40, %bb39 ], [ %i61, %bb57.bb84_crit_edge ]
  tail call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i85, ptr noundef nonnull align 8 dereferenceable(16) %i6, i64 16, i1 false)
  br label %bb87

bb87.loopexit:                                    ; preds = %bb81
  br label %bb87

bb87:                                             ; preds = %bb87.loopexit, %bb84, %bb83.bb87_crit_edge
  %i88 = phi ptr [ %i86, %bb84 ], [ %i61, %bb83.bb87_crit_edge ], [ %i61, %bb87.loopexit ]
  tail call void @free(ptr noundef %i6) #13
  tail call void @free(ptr noundef %arg) #13
  %i89 = load i8, ptr %i35, align 8, !tbaa !23
  %i90 = add i8 %i89, 1
  store i8 %i90, ptr %i35, align 8, !tbaa !23
  %i91 = getelementptr inbounds %struct.ptree, ptr %i25, i64 0, i32 1
  %i92 = load ptr, ptr %i91, align 8, !tbaa !16
  tail call void @free(ptr noundef %i92) #13
  store ptr %i88, ptr %i91, align 8, !tbaa !16
  br label %bb138

bb93:                                             ; preds = %bb117, %bb32
  %i94 = phi i32 [ 1, %bb32 ], [ %i118, %bb117 ]
  %i95 = lshr exact i32 -2147483648, %i94
  %i96 = zext nneg i32 %i95 to i64
  %i97 = and i64 %i33, %i96
  %i98 = icmp eq i64 %i97, 0
  br i1 %i98, label %bb99, label %bb93.bb123.loopexit_crit_edge

bb93.bb123.loopexit_crit_edge:                    ; preds = %bb93
  br label %bb123.loopexit

bb99:                                             ; preds = %bb93
  %i100 = lshr i32 1073741824, %i94
  %i101 = zext nneg i32 %i100 to i64
  %i102 = and i64 %i33, %i101
  %i103 = icmp eq i64 %i102, 0
  br i1 %i103, label %bb104, label %bb121

bb104:                                            ; preds = %bb99
  %i105 = lshr i32 536870912, %i94
  %i106 = zext nneg i32 %i105 to i64
  %i107 = and i64 %i33, %i106
  %i108 = icmp eq i64 %i107, 0
  br i1 %i108, label %bb109, label %bb119

bb109:                                            ; preds = %bb104
  %i110 = add nuw nsw i32 %i94, 3
  %i111 = icmp eq i32 %i110, 32
  br i1 %i111, label %bb109.bb123.loopexitsplit_crit_edge, label %bb112, !llvm.loop !27

bb109.bb123.loopexitsplit_crit_edge:              ; preds = %bb109
  br label %bb123.loopexitsplit

bb112:                                            ; preds = %bb109
  %i113 = lshr i32 268435456, %i94
  %i114 = zext nneg i32 %i113 to i64
  %i115 = and i64 %i33, %i114
  %i116 = icmp eq i64 %i115, 0
  br i1 %i116, label %bb117, label %bb123.loopexitsplitsplit

bb117:                                            ; preds = %bb112
  %i118 = add nuw nsw i32 %i94, 4
  br label %bb93

bb119:                                            ; preds = %bb104
  %i120 = add nuw nsw i32 %i94, 2
  br label %bb123

bb121:                                            ; preds = %bb99
  %i122 = add nuw nsw i32 %i94, 1
  br label %bb123

bb123.loopexitsplitsplit:                         ; preds = %bb112
  br label %bb123.loopexitsplit

bb123.loopexitsplit:                              ; preds = %bb123.loopexitsplitsplit, %bb109.bb123.loopexitsplit_crit_edge
  %i124.ph.ph = phi i32 [ 32, %bb109.bb123.loopexitsplit_crit_edge ], [ %i110, %bb123.loopexitsplitsplit ]
  br label %bb123.loopexit

bb123.loopexit:                                   ; preds = %bb123.loopexitsplit, %bb93.bb123.loopexit_crit_edge
  %i124.ph = phi i32 [ %i94, %bb93.bb123.loopexit_crit_edge ], [ %i124.ph.ph, %bb123.loopexitsplit ]
  br label %bb123

bb123:                                            ; preds = %bb123.loopexit, %bb121, %bb119
  %i124 = phi i32 [ %i120, %bb119 ], [ %i122, %bb121 ], [ %i124.ph, %bb123.loopexit ]
  %i125 = zext nneg i8 %i13 to i32
  %i126 = lshr exact i32 -2147483648, %i125
  %i127 = sext i32 %i126 to i64
  %i128 = and i64 %i11, %i127
  %i129 = icmp eq i64 %i128, 0
  br i1 %i129, label %bb134, label %bb130

bb130:                                            ; preds = %bb123
  %i131 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 5
  %i132 = load ptr, ptr %i131, align 8, !tbaa !28
  %i133 = tail call fastcc ptr @insertR(ptr noundef %i132, ptr noundef nonnull %arg, i32 noundef %i124, ptr noundef nonnull %arg1)
  store ptr %i133, ptr %i131, align 8, !tbaa !28
  br label %bb138

bb134:                                            ; preds = %bb123
  %i135 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 4
  %i136 = load ptr, ptr %i135, align 8, !tbaa !29
  %i137 = tail call fastcc ptr @insertR(ptr noundef %i136, ptr noundef nonnull %arg, i32 noundef %i124, ptr noundef nonnull %arg1)
  store ptr %i137, ptr %i135, align 8, !tbaa !29
  br label %bb138

bb138:                                            ; preds = %bb134, %bb130, %bb87, %bb53, %bb4.bb138_crit_edge, %bb.bb138_crit_edge
  %i139 = phi ptr [ %i25, %bb53 ], [ %i25, %bb87 ], [ null, %bb4.bb138_crit_edge ], [ null, %bb.bb138_crit_edge ], [ %arg, %bb134 ], [ %arg, %bb130 ]
  ret ptr %i139
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
  store ptr %i19, ptr %i20, align 8, !tbaa !29
  %i21 = select i1 %i18, ptr %arg, ptr %arg1
  %i22 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 5
  store ptr %i21, ptr %i22, align 8, !tbaa !28
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
  %i33 = load ptr, ptr %i32, align 8, !tbaa !28
  %i34 = tail call fastcc ptr @insertR(ptr noundef %i33, ptr noundef nonnull %arg1, i32 noundef %arg2, ptr noundef nonnull %arg)
  store ptr %i34, ptr %i32, align 8, !tbaa !28
  br label %bb29

bb35:                                             ; preds = %bb23
  %i36 = getelementptr inbounds %struct.ptree, ptr %arg, i64 0, i32 4
  %i37 = load ptr, ptr %i36, align 8, !tbaa !29
  %i38 = tail call fastcc ptr @insertR(ptr noundef %i37, ptr noundef nonnull %arg1, i32 noundef %arg2, ptr noundef nonnull %arg)
  store ptr %i38, ptr %i36, align 8, !tbaa !29
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
  br i1 %i27, label %bb5.bb5_crit_edge, label %bb28, !llvm.loop !30

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

bb36:                                             ; preds = %bb28, %bb.bb36_crit_edge
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
  store ptr %i18, ptr %i33, align 8, !tbaa !28
  %i34 = getelementptr inbounds %struct.ptree, ptr %i18, i64 0, i32 4
  store ptr %i18, ptr %i34, align 8, !tbaa !29
  %i35 = icmp ne i32 %arg2, 0
  br label %bb36

bb36:                                             ; preds = %bb70.bb36_crit_edge, %bb31
  %i37 = call ptr @fgets(ptr noundef nonnull %i, i32 noundef 128, ptr noundef nonnull %i12)
  %i38 = icmp eq ptr %i37, null
  br i1 %i38, label %bb76, label %bb39

bb39:                                             ; preds = %bb36
  %i40 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef nonnull %i, ptr noundef nonnull @.str.6, ptr noundef nonnull %i4, ptr noundef nonnull %i3) #13
  %i41 = call dereferenceable_or_null(40) ptr @calloc(i64 1, i64 40)
  %i42 = icmp eq ptr %i41, null
  br i1 %i42, label %bb43, label %bb44

bb43:                                             ; preds = %bb39
  call void @perror(ptr noundef nonnull @.str.3.7) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb44:                                             ; preds = %bb39
  %i45 = call dereferenceable_or_null(16) ptr @calloc(i64 1, i64 16)
  %i46 = getelementptr inbounds %struct.ptree, ptr %i41, i64 0, i32 1
  store ptr %i45, ptr %i46, align 8, !tbaa !16
  %i47 = icmp eq ptr %i45, null
  br i1 %i47, label %bb48, label %bb49

bb48:                                             ; preds = %bb44
  call void @perror(ptr noundef nonnull @.str.4.8) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb49:                                             ; preds = %bb44
  %i50 = call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #15
  %i51 = getelementptr inbounds %struct.ptree_mask, ptr %i45, i64 0, i32 1
  store ptr %i50, ptr %i51, align 8, !tbaa !25
  %i52 = icmp eq ptr %i50, null
  br i1 %i52, label %bb53, label %bb54

bb53:                                             ; preds = %bb49
  call void @perror(ptr noundef nonnull @.str.5) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb54:                                             ; preds = %bb49
  store i8 0, ptr %i50, align 1
  %i55 = load i32, ptr %i3, align 4, !tbaa !31
  %i56 = zext i32 %i55 to i64
  store i64 %i56, ptr %i41, align 8, !tbaa !20
  store i64 4294967295, ptr %i45, align 8, !tbaa !18
  %i57 = call ptr @pat_search(i64 noundef %i56, ptr noundef nonnull %i18) #13
  %i58 = load i64, ptr %i57, align 8, !tbaa !20
  %i59 = load i32, ptr %i3, align 4, !tbaa !31
  %i60 = zext i32 %i59 to i64
  %i61 = icmp eq i64 %i58, %i60
  %i62 = and i1 %i35, %i61
  br i1 %i62, label %bb63, label %bb68

bb63:                                             ; preds = %bb54
  %i64 = load float, ptr %i4, align 4, !tbaa !34
  %i65 = fpext float %i64 to double
  %i66 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, double noundef %i65, i32 noundef %i59)
  %i67 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %bb70

bb68:                                             ; preds = %bb54
  %i69 = call ptr @pat_insert(ptr noundef nonnull %i41, ptr noundef nonnull %i18) #13
  br label %bb70

bb70:                                             ; preds = %bb68, %bb63
  %i71 = phi ptr [ %i41, %bb63 ], [ %i69, %bb68 ]
  %i72 = icmp eq ptr %i71, null
  br i1 %i72, label %bb73, label %bb70.bb36_crit_edge, !llvm.loop !36

bb70.bb36_crit_edge:                              ; preds = %bb70
  br label %bb36

bb73:                                             ; preds = %bb70
  %i74 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i75 = call i64 @fwrite(ptr nonnull @.str.9, i64 21, i64 1, ptr %i74) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb76:                                             ; preds = %bb36
  %i77 = call i32 @fclose(ptr noundef nonnull %i12)
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
!27 = distinct !{!27, !15}
!28 = !{!17, !9, i64 32}
!29 = !{!17, !9, i64 24}
!30 = distinct !{!30, !15}
!31 = !{!32, !33, i64 0}
!32 = !{!"in_addr", !33, i64 0}
!33 = !{!"int", !10, i64 0}
!34 = !{!35, !35, i64 0}
!35 = !{!"float", !10, i64 0}
!36 = distinct !{!36, !15}
