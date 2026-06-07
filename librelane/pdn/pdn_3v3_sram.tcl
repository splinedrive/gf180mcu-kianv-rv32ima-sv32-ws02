# 3.3V SRAM macro PDN grids for the Run1 KianV macro placement.

set sram_N {
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way0.u_tile_0.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way0.u_tile_1.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way0.u_tile_2.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way0.u_tile_3.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way0.u_tile_4.u_prim
}

set sram_S {
    i_chip_core.u_soc.cache_I.gen_cached.dcache_I.cache_D.u_mem.u_tile_0.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way1.u_tile_6.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way1.u_tile_5.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way1.u_tile_4.u_prim
}

set sram_W {
    i_chip_core.u_soc.cache_I.gen_cached.dcache_I.cache_D.u_mem.u_tile_1.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.dcache_I.cache_D.u_mem.u_tile_2.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.dcache_I.cache_D.u_mem.u_tile_3.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.dcache_I.cache_D.u_mem.u_tile_4.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.dcache_I.cache_D.u_mem.u_tile_5.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.dcache_I.cache_D.u_mem.u_tile_6.u_prim
}

set sram_E {
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way1.u_tile_3.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way1.u_tile_2.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way1.u_tile_1.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way1.u_tile_0.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way0.u_tile_6.u_prim
    i_chip_core.u_soc.cache_I.gen_cached.icache_I.cache_I.u_mem_way0.u_tile_5.u_prim
}

define_pdn_grid \
    -macro \
    -instances "$sram_N $sram_S" \
    -name sram_macros_NS \
    -starts_with POWER \
    -halo "$::env(PDN_HORIZONTAL_HALO) $::env(PDN_VERTICAL_HALO)"

add_pdn_connect \
    -grid sram_macros_NS \
    -layers "$::env(PDN_VERTICAL_LAYER) $::env(PDN_HORIZONTAL_LAYER)"

add_pdn_connect \
    -grid sram_macros_NS \
    -layers "$::env(PDN_VERTICAL_LAYER) Metal3"

add_pdn_stripe \
    -grid sram_macros_NS \
    -layer Metal4 \
    -width 1.36 \
    -offset 0.68 \
    -spacing 0.28 \
    -pitch 298.30 \
    -starts_with GROUND \
    -number_of_straps 2

add_pdn_stripe \
    -grid sram_macros_NS \
    -layer Metal4 \
    -width 4.00 \
    -offset 50.80 \
    -spacing 0.28 \
    -pitch 48.86 \
    -starts_with GROUND \
    -number_of_straps 5

define_pdn_grid \
    -macro \
    -instances "$sram_W $sram_E" \
    -name sram_macros_WE \
    -starts_with POWER \
    -halo "$::env(PDN_HORIZONTAL_HALO) $::env(PDN_VERTICAL_HALO)"

add_pdn_connect \
    -grid sram_macros_WE \
    -layers "$::env(PDN_VERTICAL_LAYER) $::env(PDN_HORIZONTAL_LAYER)"

add_pdn_connect \
    -grid sram_macros_WE \
    -layers "$::env(PDN_VERTICAL_LAYER) Metal3"

add_pdn_stripe \
    -grid sram_macros_WE \
    -layer Metal4 \
    -width 1.36 \
    -offset 0.68 \
    -spacing 0.28 \
    -pitch 319.09 \
    -starts_with POWER \
    -number_of_straps 2

add_pdn_stripe \
    -grid sram_macros_WE \
    -layer Metal4 \
    -width 4.00 \
    -offset 28.0 \
    -spacing 0.28 \
    -pitch 43.50 \
    -starts_with GROUND \
    -number_of_straps 7
