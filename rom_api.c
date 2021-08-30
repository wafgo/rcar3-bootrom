#include <stdint.h>

typedef uint32_t(*read_flash_callback)(uint64_t srcAddr, uint8_t *pDest, uint32_t sizeToRead);
typedef uint8_t ROM_SocId_Result_t[32U];
typedef uint32_t DxMngRndBuf_t[4 * 2];

uint32_t rom_secure_boot_api(uint32_t *key_cert, uint32_t *content_cert, read_flash_callback rf);
uint32_t rom_get_soc_id(ROM_SocId_Result_t socIdBuff);
uint32_t rom_get_rnd_vector(DxMngRndBuf_t rndBuff, uint32_t *pWspace, uint32_t wspaceSize);
uint32_t rom_get_lcs(uint32_t *lcs);

#define LC_CM				(0x0U)
#define LC_DM				(0x1U)
#define LC_SD				(0x3U)
#define LC_SE				(0x5U)
#define LC_FA				(0x7U)

uint32_t rom_secure_boot_api(uint32_t *key_cert, uint32_t *content_cert, read_flash_callback rf)
{
  return 0;
}

uint32_t rom_get_soc_id(ROM_SocId_Result_t socIdBuff)
{
  for (int i = 0; i < sizeof(ROM_SocId_Result_t); ++i) {
    socIdBuff[i] = i;
  }
  return 0;
}

uint32_t rom_get_rnd_vector(DxMngRndBuf_t rndBuff, uint32_t *pWspace, uint32_t wspaceSize)
{
  for (int i = 0; i < (wspaceSize/4); ++i) {
    pWspace[i] = i;
  }
  return 0;
}

uint32_t rom_get_lcs(uint32_t *lcs)
{
  *lcs = LC_FA;
  return 0;
}

